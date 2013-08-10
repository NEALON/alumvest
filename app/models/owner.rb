class Owner < ActiveRecord::Base
  belongs_to :user
  attr_accessible :experience, :expertise, :financial_info, :marital_status, :personal_message, :ssn
end
