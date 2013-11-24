class CreateBankingAccounts < ActiveRecord::Migration
  def change
    create_table :banking_accounts do |t|

      t.references :user
      t.timestamps
    end
  end
end
