class RemoveBanking < ActiveRecord::Migration
  def change
    remove_column :bancbox_accounts, :banking_account_id
    drop_table :bancbox_identity_verifications
    drop_table :banking_accounts
  end
end
