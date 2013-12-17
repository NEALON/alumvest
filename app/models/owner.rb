class Owner < ActiveRecord::Base
  attr_accessible :experience, :expertise, :financial_info, :marital_status, :personal_message, :ssn

  belongs_to :user
  has_one :campaign
  has_one :bancbox_issuer, :class_name => 'Bancbox::Issuer'
end
