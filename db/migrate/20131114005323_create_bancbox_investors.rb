class CreateBancboxInvestors < ActiveRecord::Migration
  def change
    create_table :bancbox_investors do |t|
      t.string :name
      t.string :ssn
      t.string :investor_type
      t.string :email
      t.string :phone
      t.string :date_of_birth
      t.string :address_1
      t.string :address_2
      t.string :city_state_zip
      t.string :bancbox_status
      t.references :user

      t.timestamps
    end
  end
end
