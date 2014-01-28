class RenameOwnerToIssuer < ActiveRecord::Migration
  def change
    rename_table :owners, :issuers
    rename_column :bancbox_issuers, :owner_id, :issuer_id
    rename_column :campaigns, :owner_id, :issuer_id
  end
end
