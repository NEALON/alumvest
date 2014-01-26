class AddEncryptedSsn < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_ssn, :string
    add_column :investors, :encrypted_ssn, :string
    add_column :owners, :encrypted_ssn, :string
    add_column :bancbox_investors, :encrypted_ssn, :string
    add_column :bancbox_issuers, :encrypted_ssn, :string
    add_column :veritax_orders, :encrypted_ssn, :string
    remove_column :users, :ssn
    remove_column :investors, :ssn
    remove_column :owners, :ssn
    remove_column :bancbox_investors, :ssn
    remove_column :bancbox_issuers, :ssn
    remove_column :veritax_orders, :ssn
  end
end
