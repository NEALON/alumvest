class DisplayUpdatesController < ApplicationController

  def index
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @updates = @company.updates
  end
end