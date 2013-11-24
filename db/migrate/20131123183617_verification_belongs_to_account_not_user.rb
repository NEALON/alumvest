class VerificationBelongsToAccountNotUser < ActiveRecord::Migration
  def change
    remove_column :bancbox_identity_verifications, :user_id, :integer
    add_column :bancbox_identity_verifications, :banking_account_id, :integer
  end
end
