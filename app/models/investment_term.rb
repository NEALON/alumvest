class InvestmentTerm < ActiveRecord::Base

  attr_accessible :fundraising_amount,
                  :campaign_length,
                  :equity_type,
                  :funds_retained,
                  :fees_paid_by,
                  :elevator_pitch,
                  :investment_details,
                  :planned_fund_usage,
                  :business_plan_url,
                  :financial_statement_url,
                  :term_sheet_url,
                  :subscription_docs_attributes,
                  :other_docs_attributes,
                  :tbd_detailed_metrics_document_url,
                  :recent_investors,
                  :roadmap,
                  :shareholder_message,
                  :company_id,
                  :company

  belongs_to :company

  has_many :subscription_docs, :as => :documentable
  accepts_nested_attributes_for :subscription_docs, :reject_if => :all_blank, :allow_destroy => true

  has_many :other_docs, :as => :documentable
  accepts_nested_attributes_for :other_docs, :reject_if => :all_blank, :allow_destroy => true

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      [:fundraising_amount,
       :campaign_length,
       :equity_type,
       :funds_retained,
       :fees_paid_by,
       :elevator_pitch,
       :investment_details,
       :planned_fund_usage,
       :business_plan_url,
       :financial_statement_url,
       :term_sheet_url,
       :tbd_detailed_metrics_document_url,
       :recent_investors,
       :roadmap,
       :shareholder_message].each do |attr|
        validates attr, :presence => true
      end
      validates_numericality_of [:fundraising_amount, :campaign_length]
    end
  end
end