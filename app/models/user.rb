class User < ActiveRecord::Base
  before_save :update_user_type
  after_create :send_welcome_email

  attr_accessible :provider, :uid, :name, :first_name, :middle_name, :last_name, :gender, :date_of_birth,
                  :email, :facebook, :linkedin, :profile_complete, :user_type, :avatar_url
  attr_accessible :investor_attributes, :owner_attributes, :educations_attributes

  has_filepicker_image :avatar, styles: {medium: [300, 300], thumb: [128, 128]}

  has_many :identities
  has_one :demographic
  has_one :investor

  has_one :banking_account, :class_name => 'Banking::Account'

  has_one :bancbox_investor, :class_name => 'Bancbox::Investor'
  has_one :bancbox_issuer, :class_name => 'Bancbox::Issuer'
  has_one :bancbox_identity_verification, :class_name => 'Bancbox::IdentityVerification'

  def available_funds
    unless banking_account
      0
    else
      banking_account.balance # TODO: but this fails to take into account other pending transfers for other pending investments?
    end
  end

  has_one :owner
  accepts_nested_attributes_for :investor, :owner
  has_many :follows, dependent: :destroy
  has_many :educations, dependent: :destroy
  accepts_nested_attributes_for :educations, allow_destroy: true

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth['provider'], auth['uid']) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.first_name = auth['info']['first_name']
      user.last_name = auth['info']['last_name']
      user.name = user.first_name + ' ' + user.last_name
      user.email = auth['info']['email']
      if auth['provider'] == 'identity'
        user.user_type = auth['info']['description'] # user_type is not part of omniauth standard schema, so we use description
      else
        user.user_type = 'not_defined'
      end

      if Rails.env.production?
        Gibbon::API.new.lists.subscribe(:id => ENV['MAILCHIMP_LIST_ID'], :email => {:email => user.email},
            :merge_vars => {:FNAME => user.first_name, :LNAME => user.last_name},
            :double_optin => false, :update_existing => true, :send_welcome => false)
      end
    end
  end

  def complete!
    update_attribute(:profile_complete, true)
  end

  def is_investor?
    user_type.downcase == 'investor'
  end

  def is_self_accredited_investor?
    not (self.is_investor? and self.investor.accredited_investor_status.nil?)
  end

  def is_accredited_investor?
    return false unless self.is_investor?
    self.investor.accredited_investor_status == 'approved'
  end

  def is_owner?
    user_type.downcase == 'owner'
  end

  def is_admin?
    user_type.downcase == 'admin'
  end

  def user_type_undefined?
    !is_owner? && !is_investor?
  end

  def update_user_type
    if self.user_type_changed?
      if self.is_investor?
        self.investor = Investor.new
      end
      if self.is_owner?
        self.owner = Owner.new
      end
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

  def following?(campaign)
    follows.exists?(campaign_id: campaign.id)
  end

  def follow!(campaign)
    follows.create!(campaign_id: campaign.id)
  end

  def unfollow!(campaign)
    f = campaign.follows.find_by_user_id(id)
    f.destroy unless f.nil?
  end

  def avatar_small
    avatar_url.blank? ? '/images/user_24.png' : avatar(w:24, h:24)
  end
end
