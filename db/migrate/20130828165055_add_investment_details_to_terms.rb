class AddInvestmentDetailsToTerms < ActiveRecord::Migration
  def change
    add_column :investment_terms, :investment_details, :text
  end
end
