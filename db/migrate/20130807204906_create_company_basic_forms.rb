class CreateCompanyBasicForms < ActiveRecord::Migration
  def change
    create_table :company_basic_forms do |t|
      t.string :name
      t.string :ownership_structure
      t.string :logo_url
      t.string :url
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.date :founded_on
      t.text :summary

      t.references :category
      t.references :industry

      t.timestamps
    end
  end
end
