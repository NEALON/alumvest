class CreateBancboxIssuers < ActiveRecord::Migration
  def change
    create_table :bancbox_issuers do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :name
      t.string :ssn
      t.string :investor_type
      t.string :email
      t.string :phone
      t.string :date_of_birth
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :company_name
      t.string :company_type
      t.string :company_registration_state
      t.string :company_tax_id
      t.string :bancbox_status
      t.string :reference_id
      t.string :bancbox_id
      t.string :bank_name
      t.string :account_number
      t.string :account_routing_number
      t.string :account_type
      t.boolean :agreement
      t.references :user

      t.timestamps
    end
  end
end
