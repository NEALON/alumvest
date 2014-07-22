class Alumvest::OnlinePaymentBase < ActiveRecord::Base
  include Alumvest::OnlinePaymentState
  include Alumvest::OnlinePaymentEvents
  include Alumvest::OnlinePaymentPresenters

  attr_accessible :investment,
                  :investment_id,
                  :campaign,
                  :campaign_id,
                  :bank_account_holder,
                  :bank_account_type,
                  :bank_account_routing,
                  :bank_account_number,
                  :nickname,
                  :accept_terms
                  
  self.table_name = :online_payments

  belongs_to :investment,
             :class_name => 'Alumvest::InvestmentBase'

  has_one :funding_xn,
          :class_name => 'Bancbox::FundingXn',
          :foreign_key => 'payment_id'

  validates_presence_of [:bank_account_number, :bank_account_type, :bank_account_holder, :bank_account_routing]
  
  validates :accept_terms, :inclusion => {:in => [true]}
end
