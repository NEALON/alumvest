class AddDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :type
      t.string :file_url
      t.integer :documentable_id
      t.string :documentable_type
      t.timestamps
    end
  end
end
