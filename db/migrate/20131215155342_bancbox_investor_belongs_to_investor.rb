class BancboxInvestorBelongsToInvestor < ActiveRecord::Migration
  def change
    remove_column :bancbox_investors, :banking_account_id, :integer
    add_column :bancbox_investors, :investor_id, :integer
  end
end
