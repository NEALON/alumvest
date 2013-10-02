class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user
      t.references :campaign

      t.timestamps
    end
    add_index :follows, :user_id
    add_index :follows, :campaign_id
    add_index :follows, [:user_id, :campaign_id], unique: true
  end
end
