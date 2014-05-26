class AddInvestorStuff < ActiveRecord::Migration
  def change
    add_column :investors, :tagline, :string
    add_column :investors, :website, :string
    add_column :investors, :bio, :text
    add_column :investors, :city, :string
    add_column :investors, :state, :string
    add_column :investors, :zip, :string
    add_column :investors, :photo_url, :string

    add_column :investors, :hide_investments, :boolean
    add_column :investors, :hide_investor_status, :boolean

    add_column :investors, :legal_name, :string
    add_column :investors, :legal_address, :string
    add_column :investors, :legal_city, :string
    add_column :investors, :legal_state, :string
    add_column :investors, :legal_postal_code, :string
    add_column :investors, :legal_country, :string
  end
end
