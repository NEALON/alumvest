class Investor < ActiveRecord::Base
  belongs_to :user
  attr_accessible :accredited_investor_status, :company, :experience, :expertise, :financial_info, :income, :income_type, :industry, :investor_representations, :job_title, :marital_status, :net_worth, :personal_message, :spending_habits, :ssn, :user_id, :user

  has_many :investment_finalizations
end
