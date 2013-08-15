class CreateCampaign < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :permalink
      t.string :title
      t.string :headline
      t.text :summary
      t.text :pitch
      t.integer :amount
      t.text :planned_fund_usage
      t.integer :length_in_days
      t.string :photo_url
      t.string :video_url

      t.references :company_worksheet
      t.timestamps
    end
  end
end
