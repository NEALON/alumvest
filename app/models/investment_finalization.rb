class InvestmentFinalization < ActiveRecord::Base
  attr_accessible :status, :campaign, :investor

  belongs_to :campaign
  belongs_to :investor

  has_one :payment_information
  has_one :questionnaire
  has_one :identity_verification
  has_one :contract_doc_group
  has_one :subscription_agreement
  has_one :irs_doc_group

  state_machine :status, :initial => :draft
end
