class CreateBancboxFundTransactions < ActiveRecord::Migration
  def change
    create_table :bancbox_fund_transactions do |t|
      t.integer :trans_id
      t.string :status
      t.boolean :trans_status
      t.integer :amount
      t.string :memo
      t.text :text
      t.references :bancbox_bank_account, index: true
      t.references :bancbox_investor, index: true
      t.references :bancbox_issuer, index: true

      t.timestamps
    end
  end
end
