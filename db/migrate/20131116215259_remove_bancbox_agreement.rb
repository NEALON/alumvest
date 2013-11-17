class RemoveBancboxAgreement < ActiveRecord::Migration
  def change
    drop_table :bancbox_agreements
  end
end
