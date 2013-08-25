class AddCampaignLengthToInvestmentTerms < ActiveRecord::Migration
  def change
    add_column :investment_terms, :campaign_length, :integer
    remove_column :campaigns, :length_in_days
  end
end
