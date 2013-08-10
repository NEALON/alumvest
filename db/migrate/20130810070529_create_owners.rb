class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :ssn
      t.text :financial_info
      t.text :experience
      t.text :expertise
      t.string :marital_status
      t.text :personal_message
      t.references :user

      t.timestamps
    end
    add_index :owners, :user_id
  end
end
