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
    @user = @campaign.company_worksheet.owner.user
  end

  def edit
    @company_worksheet = CompanyWorksheet.find(params[:company_worksheet_id])
    @campaign = Campaign.find(params[:id])
    render :action => :new
  end

  def update
    @company_worksheet = CompanyWorksheet.find(params[:company_worksheet_id])
    @campaign = Campaign.find(params[:id])
    @campaign.update_attributes(params[:campaign])
    if @campaign.valid?
      redirect_to company_worksheet_campaign_path(@company_worksheet, @campaign), :notice => 'Campaign info saved.'
    else
      render :edit
    end
  end

  def team
    load_stuff_for_subsections
  end

  def investment_term
    load_stuff_for_subsections
  end

  def updates
    load_stuff_for_subsections
  end

  def join_us
    load_stuff_for_subsections
  end

  private

  def load_stuff_for_subsections
    @company_worksheet = CompanyWorksheet.find(params[:company_worksheet_id])
    @campaign = Campaign.find(params[:campaign_id])
    @user = @campaign.company_worksheet.owner.user
  end

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:photo_url] = 'http://placehold.it/30x30'
      params
    else
      params
    end
  end
end
