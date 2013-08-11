class CompanyWorksheet < ActiveRecord::Base
  attr_accessible :owner_id

  belongs_to :owner
  has_one :company_basic_form
  has_one :company_personnel_form
  has_one :company_market_form
  has_one :company_funding_doc_form
end
