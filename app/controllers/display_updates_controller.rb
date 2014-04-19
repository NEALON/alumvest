class DisplayUpdatesController < ApplicationController

  def index
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @updates = @company.updates
  end
end