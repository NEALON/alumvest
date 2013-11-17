class AddBankInfoToBancboxInvestor < ActiveRecord::Migration
  def up
    add_column :bancbox_investors, :bank_name, :string
    add_column :bancbox_investors, :account_number, :string
    add_column :bancbox_investors, :account_routing_number, :string
    add_column :bancbox_investors, :account_type, :string
  end

  def down
    remove_column :bancbox_investors, :bank_name
    remove_column :bancbox_investors, :account_number
    remove_column :bancbox_investors, :account_routing_number
    remove_column :bancbox_investors, :account_type
  end
end
