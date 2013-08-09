class User < ActiveRecord::Base
  has_paper_trail

  attr_accessible :provider, :uid, :name, :first_name, :middle_name, :last_name, :gender, :date_of_birth, :email, :facebook, :linkedin, :mobile_phone, :home_phone, :address_1, :address_2, :city, :state, :zipcode, :personal_statement

  has_many :identities

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
    end
  end
end
