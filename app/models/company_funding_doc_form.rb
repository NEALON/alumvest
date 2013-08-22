class CompanyFundingDocForm < ActiveRecord::Base

  attr_accessible :business_plan_url,
    :tbd_financial_document_url,
    :tbd_funding_document_url,
    :tbd_detailed_metrics_document_url,
    :recent_investors,
    :roadmap,
    :shareholder_message,
    :company_worksheet_id

  belongs_to :company_worksheet

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      [:business_plan_url,
          :tbd_financial_document_url,
          :tbd_funding_document_url,
          :tbd_detailed_metrics_document_url,
          :recent_investors,
          :roadmap,
          :shareholder_message].each do |attr|
        validates attr, :presence => true
      end
    end
  end
end