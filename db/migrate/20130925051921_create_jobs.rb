class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :contact
      t.references :company

      t.timestamps
    end
    add_index :jobs, :company_id
  end
end
