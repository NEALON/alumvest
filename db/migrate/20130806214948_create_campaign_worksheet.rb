class CreateCampaignWorksheet < ActiveRecord::Migration
  def change
    create_table :campaign_worksheets do |t|
      t.string :permalink
      t.string :name
      t.string :headline
      t.text :summary
      t.text :about
    end
  end
end
