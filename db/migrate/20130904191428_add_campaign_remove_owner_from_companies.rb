class AddCampaignRemoveOwnerFromCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :campaign_id, :integer
    remove_column :companies, :owner_id

    add_column :teams, :campaign_id, :integer
    remove_column :teams, :company_id

    add_column :investment_terms, :campaign_id, :integer
    remove_column :investment_terms, :company_id
  end
end
