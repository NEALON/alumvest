class CreateBancboxTransactions < ActiveRecord::Migration
  def change
    create_table :bancbox_transactions do |t|
      t.string :type
      t.decimal :value

      t.references :bancbox_account
      t.timestamps
    end
  end
end
