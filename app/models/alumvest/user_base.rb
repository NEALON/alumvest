class Alumvest::UserBase < ActiveRecord::Base

  include Alumvest::UserRoles
  include Alumvest::UserPresenters

  before_save :update_user_type
  after_create :send_welcome_email

  self.table_name = :users

  attr_accessible :provider,
                  :uid,
                  :name,
                  :first_name,
                  :middle_name,
                  :last_name,
                  :gender,
                  :date_of_birth,
                  :email,
                  :facebook,
                  :linkedin,
                  :user_type,
                  :avatar_url,
                  :investor_attributes,
                  :issuer_attributes,
                  :educations_attributes,
                  :mobile_phone,
                  :home_phone,
                  :address_1,
                  :address_2,
                  :city,
                  :state,
                  :zipcode,
                  :personal_statement,
                  :ssn,
                  :direct_message_pref,
                  :comment_reply_pref,
                  :update_pref,
                  :funding_milestone_pref,
                  :profile_update_pref,
                  :answer_pref,
                  :alumvest_update_pref,
                  :featured_startup_pref,
                  :highlighted_update_pref

  attr_encrypted :ssn, :key => Rails.env.test? ? 'ssn_secret' : ENV['SSN_SECRET']

  has_filepicker_image :avatar, :styles => {:medium => [300, 300], :thumb => [128, 128]}

  has_many :identities,
           :class_name => 'Alumvest::Identity',
           :foreign_key => 'user_id'
  has_one :investor,
          :class_name => 'Alumvest::InvestorBase',
          :foreign_key => 'user_id'
  has_one :issuer,
          :class_name => 'Alumvest::IssuerBase',
          :foreign_key => 'user_id'
  has_many :follows,
           :dependent => :destroy,
           :class_name => 'Alumvest::Follow',
           :foreign_key => 'user_id'
  has_many :educations,
           :dependent => :destroy,
           :class_name => 'Alumvest::Education',
           :foreign_key => 'user_id'
  has_one :bank_account,
          :class_name => 'Bancbox::BankAccount',
          :foreign_key => 'user_id'

  RequiredProfileFields = [
      :first_name,
      :last_name,
      :gender,
      :mobile_phone,
      :home_phone,
      :address_1,
      :city,
      :state,
      :zipcode,
      :email]

  validates_presence_of RequiredProfileFields, :on => :update, :unless => "user_type_changed?"
  validates :ssn, :ssn => true, :allow_blank => true

  def update_user_type?
    user
  end

  def profile_complete?
    RequiredProfileFields.select { |rpf| send(rpf).blank? }.empty?
  end

  accepts_nested_attributes_for :investor, :issuer
  accepts_nested_attributes_for :educations, :allow_destroy => true

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

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

  def following?(campaign)
    follows.exists?(:campaign_id => campaign.id)
  end

  def follow!(campaign)
    follows.create!(:campaign_id => campaign.id)
  end

  def unfollow!(campaign)
    f = campaign.follows.find_by_user_id(id)
    f.destroy unless f.nil?
  end
end