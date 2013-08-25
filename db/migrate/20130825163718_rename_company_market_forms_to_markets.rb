class RenameCompanyMarketFormsToMarkets < ActiveRecord::Migration
  def change
    rename_table :company_market_forms, :markets
  end
end
