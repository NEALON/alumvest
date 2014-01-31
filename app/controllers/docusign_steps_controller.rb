class DisplayJobsController < ApplicationController

  def index
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @jobs = @company.jobs
  end
end
