class CreateBancboxAccounts < ActiveRecord::Migration
  def change
    create_table :bancbox_accounts do |t|
      t.string :status

      t.references :banking_account
      t.timestamps
    end
  end
end
