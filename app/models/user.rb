class User < ActiveRecord::Base
  has_paper_trail

  attr_accessible :provider, :uid, :name, :first_name, :middle_name, :last_name, :gender, :date_of_birth, :email, :facebook, :linkedin, :mobile_phone, :home_phone, :address_1, :address_2, :city, :state, :zipcode, :personal_statement, :profile_complete, :user_type
  attr_accessible :avatar_url
  attr_accessible :investor_attributes, :owner_attributes

  has_filepicker_image :avatar, styles: {medium: [300, 300], thumb: [128, 128]}

  has_many :identities
  has_one :investor
  has_one :owner
  accepts_nested_attributes_for :investor, :owner

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.name = user.first_name + " " + user.last_name
      user.email = auth["info"]["email"]
      user.user_type = auth["info"]["description"] # user_type is not part of omniauth standard schema, so we use description

      if user.is_investor?
        user.investor = Investor.new
      end

      if user.is_owner?
        user.owner = Owner.new
      end
    end
  end

  def complete!
    update_attribute(:profile_complete, true)
  end

  def is_investor?
    user_type == "investor"
  end

  def is_owner?
    user_type == "owner"
  end
end
