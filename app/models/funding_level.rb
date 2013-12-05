class FundingLevel < ActiveRecord::Base
  include FinalizationStep
  attr_accessible :amount

  validates_presence_of :amount
  validates_numericality_of :amount
end
