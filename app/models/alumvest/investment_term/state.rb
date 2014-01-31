require 'active_support/concern'

module Alumvest::InvestmentTerm::State
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :draft do
      event :make_ready_for_review do
        transition :draft => :ready_for_review
      end

      state :ready_for_review do
        validates_numericality_of [:fundraising_amount, :min_investment, :max_investment, :campaign_length]

        [:fundraising_amount,
         :min_investment,
         :max_investment,
         :campaign_length,
         :equity_type,
         :funds_retained,
         :fees_paid_by,
         :elevator_pitch,
         :investment_details,
         :business_plan_url,
         :financial_statement_url,
         :term_sheet_url].each do |attr|
          validates attr, :presence => true
        end
      end
    end
  end
end