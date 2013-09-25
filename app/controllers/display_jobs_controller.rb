class DisplayJobsController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @jobs = @company.jobs
  end
end
