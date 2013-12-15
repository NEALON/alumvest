class BankingAccountBelongsToUser < ActiveRecord::Migration
  def change
    remove_column :bancbox_bank_accounts, :bancbox_investor_id, :integer
    remove_column :bancbox_bank_accounts, :bancbox_issuer_id, :integer
    add_column :bancbox_bank_accounts, :user_id, :integer
  end
end
