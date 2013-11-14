class CreateBancboxIdentityVerifications < ActiveRecord::Migration
  def change
    create_table :bancbox_identity_verifications do |t|
      t.string :bancbox_status
      t.boolean :is_verified, :default => false
      t.references :user

      t.timestamps
    end
  end
end
