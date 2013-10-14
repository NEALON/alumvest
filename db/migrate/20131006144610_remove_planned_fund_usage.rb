class RemovePlannedFundUsage < ActiveRecord::Migration
  def change
    remove_column :investment_terms, :planned_fund_usage
  end
end
