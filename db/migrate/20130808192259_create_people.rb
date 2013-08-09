class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :type # needed for STI to differentiate polymorphic associations
      t.string :first_name
      t.string :last_name
      t.integer :populatable_id
      t.string :populatable_type
      t.timestamps
    end
  end
end
