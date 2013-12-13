class Questionnaire < ActiveRecord::Base
  include InvestmentStep
  attr_accessible :status, :annual_income, :year_of_income, :income_type, :net_worth

  ANNUAL_INCOMES = ["Below $200,000", "$200,000 to $299,999", "$300,000 and above"]
  INCOME_YEARS = ["2013", "2012", "2011", "2010"]
  INCOME_TYPES = ["Individual", "Joint with Spouse"]
  NET_WORTHS = ["Under $1 million", "Above $1 million"]
end
