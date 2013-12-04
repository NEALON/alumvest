class AddMinMaxInvestment < ActiveRecord::Migration
  def change
    add_column :investment_terms, :min_investment, :decimal
    add_column :investment_terms, :max_investment, :decimal
  end
end
