class Alumvest::InvestorBase < ActiveRecord::Base

  self.table_name = :investors

  belongs_to :user, :class_name => 'Alumvest::UserBase'

  attr_encrypted :ssn, :key => Rails.env.test? ? 'ssn_secret' : ENV['SSN_SECRET']

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

  has_one :self_accredited_status,
          :class_name => 'Alumvest::SelfAccreditedStatus',
          :foreign_key => 'investor_id'
  has_one :bancbox_investor,
          :class_name => 'Bancbox::Investor',
          :foreign_key => 'investor_id'
  has_one :income_verification,
          :class_name => 'Veritax::OrderBase',
          :foreign_key => 'investor_id'
  has_many :investments,
           :class_name => 'Alumvest::InvestmentBase',
           :foreign_key => 'investor_id'
  has_many :campaigns, :through => :investments
  has_many :events,
           :class_name => 'Bus::Event',
           :foreign_key => 'investor_id'

  validates :ssn, :ssn => true, :allow_blank => true

  def invested_in?(campaign)
    campaigns.include?(campaign)
  end

  def is_accredited?
    accredited_investor_status == 'approved'
  end

  def approve!
    update_attribute(:accredited_investor_status, 'approved')
  end

  def finishes_self_accredited_form?
    self_accredited_status and self_accredited_status.valid?
  end
end