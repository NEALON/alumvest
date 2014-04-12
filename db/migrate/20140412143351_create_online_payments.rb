class CreateOnlinePayments < ActiveRecord::Migration
  def change
    create_table :online_payments do |t|
      t.decimal :amount
      t.string :bank_account_number
      t.string :bank_account_type
      t.string:bank_account_holder
      t.string:bank_account_routing

      t.references :escrow
      t.references :investment
      t.timestamps
    end
  end
end
