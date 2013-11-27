class AddStatusToBankingAccount < ActiveRecord::Migration
  def change
    add_column :banking_accounts, :status, :string
  end
end
