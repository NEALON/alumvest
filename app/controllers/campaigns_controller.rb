class CampaignsController < ApplicationController
  def new
    @company_worksheet = CompanyWorksheet.find(params[:company_worksheet_id])
    @campaign = Campaign.new(:company_worksheet_id => @company_worksheet.id)
  end

  def create
    @company_worksheet = CompanyWorksheet.find(params[:company_worksheet_id])
    @campaign = Campaign.create(add_images_if_test!(params[:campaign]))
    if @campaign.save
      redirect_to company_worksheet_campaign_path(@company_worksheet, @campaign), :notice => 'Campaign info saved.'
    else
      render :action => :new
    end
  end

  def show
    @company_worksheet = CompanyWorksheet.find(params[:company_worksheet_id])
    @campaign = Campaign.find(params[:id])
  end

  def edit
    @company_worksheet = CompanyWorksheet.find(params[:company_worksheet_id])
    @campaign = Campaign.new
  end

  def update

  end

  private

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:photo_url] = 'http://placehold.it/30x30'
      params
    else
      params
    end
  end
end
