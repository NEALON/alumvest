class AddBancboxIdAndReferenceIdToBancboxBankAccounts < ActiveRecord::Migration
  def change
    add_column :bancbox_bank_accounts, :bancbox_id, :string
    add_column :bancbox_bank_accounts, :reference_id, :string
  end
end
