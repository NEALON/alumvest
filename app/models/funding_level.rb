class FundingLevel < ActiveRecord::Base
  include InvestmentStep

  attr_accessible :amount

  validates_presence_of :amount
  validates :amount, :numericality => {:less_than_or_equal_to => 10000000} #max 10M
end
