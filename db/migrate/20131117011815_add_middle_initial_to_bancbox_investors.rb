class AddMiddleInitialToBancboxInvestors < ActiveRecord::Migration
  def change
    add_column :bancbox_investors, :middle_initial, :string
  end
end
