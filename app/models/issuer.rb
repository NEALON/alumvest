class Issuer < ActiveRecord::Base
  attr_accessible :experience, :expertise, :financial_info, :marital_status, :personal_message, :ssn
  attr_encrypted :ssn, :key => Rails.env.test? ? 'ssn_secret' : ENV['SSN_SECRET']

  belongs_to :user
  has_one :campaign
  has_one :bancbox_issuer, :class_name => 'Bancbox::Issuer'

  validates :ssn, ssn: true, :allow_blank => true
end
