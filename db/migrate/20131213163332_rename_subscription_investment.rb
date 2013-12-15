class RenameSubscriptionInvestment < ActiveRecord::Migration
  def change
    rename_column :subscription_agreements, :investment_finalization_id, :investment_id
  end
end
