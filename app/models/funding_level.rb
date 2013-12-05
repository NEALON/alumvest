class FundingLevel < ActiveRecord::Base
  include FinalizationStep
  attr_accessible :amount
end
