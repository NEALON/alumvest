class AddDefaultValueToBancboxPerson < ActiveRecord::Migration
  def up
    change_column :bancbox_investors, :funds, :integer, :default => 0
    change_column :bancbox_issuers, :funds, :integer, :default => 0
    change_column :bancbox_investors, :pendingbalance, :integer, :default => 0
    change_column :bancbox_issuers, :pendingbalance, :integer, :default => 0
  end
end
