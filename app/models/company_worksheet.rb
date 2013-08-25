class CompanyWorksheet < ActiveRecord::Base
  attr_accessible :owner_id

  belongs_to :owner
  has_one :company
  has_one :team
  has_one :company_market_form
  has_one :investment_term
  has_many :campaigns
end
