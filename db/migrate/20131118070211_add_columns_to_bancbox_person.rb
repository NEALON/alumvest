class AddColumnsToBancboxPerson < ActiveRecord::Migration
  def change
    add_column :bancbox_investors, :funds, :integer
    add_column :bancbox_investors, :pendingbalance, :integer
    add_column :bancbox_issuers, :funds, :integer
    add_column :bancbox_issuers, :pendingbalance, :integer
  end
end
