class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :result
      t.text :notes
      t.integer :campaign_id

      t.timestamps
    end
  end
end
