class AddFundsRetainedToInvestmentTerms < ActiveRecord::Migration
  def change
    add_column :investment_terms, :funds_retained, :string
  end
end
