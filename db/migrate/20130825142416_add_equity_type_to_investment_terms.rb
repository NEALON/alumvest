class AddEquityTypeToInvestmentTerms < ActiveRecord::Migration
  def change
    add_column :investment_terms, :equity_type, :string
  end
end
