class Investor < ActiveRecord::Base
  belongs_to :user
  attr_encrypted :ssn, :key => ENV['SSN_SECRET']
  attr_accessible :accredited_investor_status,
                  :company,
                  :experience,
                  :expertise,
                  :financial_info,
                  :income,
                  :income_type,
                  :industry,
                  :investor_representations,
                  :job_title,
                  :marital_status,
                  :net_worth,
                  :personal_message,
                  :spending_habits,
                  :ssn,
                  :user_id,
                  :user

  has_one :bancbox_investor, class_name: 'Bancbox::Investor'
  has_one :income_verification, class_name:  'Veritax::Order'

  has_many :investments
  has_many :events, :class_name => 'Bus::Event'

  validates :ssn, ssn: true, :allow_blank => true
end
