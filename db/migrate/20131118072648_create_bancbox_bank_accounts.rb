class CreateBancboxBankAccounts < ActiveRecord::Migration
  def change
    create_table :bancbox_bank_accounts do |t|
      t.string :bank_account_number
      t.string :bank_account_type
      t.string :bank_account_holder
      t.string :bank_account_routing
      t.references :bancbox_investor, index: true
      t.references :bancbox_issuer, index: true

      t.timestamps
    end
  end
end
