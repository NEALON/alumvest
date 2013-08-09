class InitFieldsToUser < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :email, :string
    add_column :users, :facebook, :string
    add_column :users, :linkedin, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :home_phone, :string
    add_column :users, :address_1, :string
    add_column :users, :address_2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
    add_column :users, :personal_statement, :text
  end

  def down
    remove_column :users, :first_name
    remove_column :users, :middle_name
    remove_column :users, :last_name
    remove_column :users, :gender
    remove_column :users, :date_of_birth
    remove_column :users, :email
    remove_column :users, :facebook
    remove_column :users, :linkedin
    remove_column :users, :mobile_phone
    remove_column :users, :home_phone
    remove_column :users, :removeress_1
    remove_column :users, :removeress_2
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :zipcode
    remove_column :users, :personal_statement
  end
end
