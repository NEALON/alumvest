class DisplayJobsController < ApplicationController

  def index
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @jobs = @company.jobs
  end
end
