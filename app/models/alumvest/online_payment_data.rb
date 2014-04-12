require 'active_support/concern'

module Alumvest::OnlinePaymentData
  extend ActiveSupport::Concern

  included do
    attr_accessible :investment,
                    :investment_id,
                    :campaign,
                    :campaign_id,
                    :bank_account_holder,
                    :bank_account_type,
                    :bank_account_routing,
                    :bank_account_number

    self.table_name = :online_payments

    belongs_to :investment, :class_name => 'Alumvest::Investment::Base'

    has_one :funding_xn, :class_name => 'Bancbox::FundingXn', :foreign_key => 'investment_id'

    validates_presence_of [:bank_account_number, :bank_account_type, :bank_account_holder, :bank_account_routing]
  end
end