class CompanyWorksheet < ActiveRecord::Base
  attr_accessible :owner_id

  belongs_to :owner
  has_one :company
  has_one :team
  has_one :market
  has_one :investment_term
end
