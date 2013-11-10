class CreateBusEventCampaignSubmittedForReview < ActiveRecord::Migration
  def change
    add_column :bus_events, :campaign_id, :integer
  end
end
