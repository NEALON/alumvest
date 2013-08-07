class CampaignWorksheetsController < ApplicationController
  def new
    @campaign_worksheet = CampaignWorksheet.new
  end

  def create
    @campaign_worksheet = CampaignWorksheet.create(params[:campaign_worksheet])
    if @campaign_worksheet.valid?
      render :text => 'ok'
    else
      render :action => :new
    end

  end
end
