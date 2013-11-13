class Demographic < ActiveRecord::Base
  attr_accessible :mobile_phone, :home_phone, :address_1, :address_2, :city, :state, :zipcode, :personal_statement, :user, :user_id

  belongs_to :user
end
