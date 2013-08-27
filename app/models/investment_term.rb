class InvestmentTerm < ActiveRecord::Base

  attr_accessible :fundraising_amount,
                  :equity_type,
                  :funds_retained,
                  :planned_fund_usage,
                  :campaign_length,
                  :business_plan_url,
                  :tbd_financial_document_url,
                  :tbd_funding_document_url,
                  :tbd_detailed_metrics_document_url,
                  :recent_investors,
                  :roadmap,
                  :shareholder_message,
                  :company_id,
                  :company

  belongs_to :company

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      [:fundraising_amount,
       :equity_type,
       :funds_retained,
       :planned_fund_usage,
       :campaign_length,
       :business_plan_url,
       :tbd_financial_document_url,
       :tbd_funding_document_url,
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