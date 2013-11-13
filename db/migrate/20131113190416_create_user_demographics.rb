class CreateUserDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.string :mobile_phone
      t.string :home_phone
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.text :personal_statement
      t.references :user
    end

    remove_column :users, :mobile_phone, :string
    remove_column :users, :home_phone, :string
    remove_column :users, :address_1, :string
    remove_column :users, :address_2, :string
    remove_column :users, :city, :string
    remove_column :users, :state, :string
    remove_column :users, :zipcode, :string
    remove_column :users, :personal_statement, :text
  end
end
