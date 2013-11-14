class CreateBancboxAgreements < ActiveRecord::Migration
  def change
    create_table :bancbox_agreements do |t|
      t.boolean :is_agreed, :default => false
      t.references :user

      t.timestamps
    end
  end
end
