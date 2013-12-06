class CombineUsersAndDemographics < ActiveRecord::Migration
  def change
    drop_table :demographics
    add_column :users, :ssn, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :home_phone, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
    add_column :users, :personal_statement, :text
  end
end
