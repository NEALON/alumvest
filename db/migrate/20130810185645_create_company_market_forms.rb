class CreateCompanyMarketForms < ActiveRecord::Migration

  def change
    create_table :company_market_forms do |t|
      t.string :product_media_url
      t.text :market_info
      t.text :competitive_landscape

      t.references :company_worksheet
      t.timestamps
    end
  end
end
