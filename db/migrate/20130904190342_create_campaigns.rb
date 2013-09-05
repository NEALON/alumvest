class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :status
      t.references :owner

      t.timestamps
    end
  end
end
