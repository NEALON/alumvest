class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string "subject"
      t.text "details"
      t.string "visibility"
      t.string "video_url"
      t.references :company

      t.timestamps
    end
  end
end
