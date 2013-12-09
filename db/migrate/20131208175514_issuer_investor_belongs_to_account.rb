class IssuerInvestorBelongsToAccount < ActiveRecord::Migration
  def change
    remove_column :bancbox_investors, :user_id, :integer
    remove_column :bancbox_issuers, :user_id, :integer
    add_column :bancbox_investors, :banking_account_id, :integer
    add_column :bancbox_issuers, :banking_account_id, :integer
  end
end
