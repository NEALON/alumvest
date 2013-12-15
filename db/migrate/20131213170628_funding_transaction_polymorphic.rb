class FundingTransactionPolymorphic < ActiveRecord::Migration
  def change
    remove_column :bancbox_fund_transactions, :bancbox_investor_id, :integer
    remove_column :bancbox_fund_transactions, :bancbox_issuer_id, :integer
    add_column :bancbox_fund_transactions, :fundable_id, :integer
    add_column :bancbox_fund_transactions, :fundable_type, :string
  end
end
