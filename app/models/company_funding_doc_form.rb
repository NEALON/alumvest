class CompanyFundingDocForm < ActiveRecord::Base

  attr_accessible :business_plan_url,
    :tbd_financial_document_url,
    :tbd_funding_document_url,
    :tbd_detailed_metrics_document_url,
    :recent_investors,
    :roadmap,
    :shareholder_message
  
end