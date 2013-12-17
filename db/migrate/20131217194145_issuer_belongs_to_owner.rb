class IssuerBelongsToOwner < ActiveRecord::Migration
  def change
    remove_column :bancbox_issuers, :investor_type, :string
    remove_column :bancbox_issuers, :banking_account_id, :integer
    add_column :bancbox_issuers, :owner_id, :integer
  end
end
