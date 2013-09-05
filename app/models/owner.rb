class Owner < ActiveRecord::Base
  attr_accessible :experience, :expertise, :financial_info, :marital_status, :personal_message, :ssn

  belongs_to :user
  has_one :campaign
end
