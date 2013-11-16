class AddAgreementToBancboxInvestor < ActiveRecord::Migration
  def up
    add_column :bancbox_investors, :agreement, :bool
  end

  def down
    remove_column :bancbox_investors, :agreement
  end
end
