class CompaniesController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @company = Company.new(:campaign => @campaign)
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @company = Company.create(add_images_if_test!(params[:company]))
    if @company.valid?
      redirect_to campaign_company_path(@campaign), :notice => 'Company saved.'
    else
      render :action => :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    render :new
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @company.update_attributes(add_images_if_test!(params[:company]))
    if @company.valid?
      redirect_to campaign_company_path(@campaign), :notice => 'Company saved.'
    else
      render :edit
    end
  end

  def check_for_completeness
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @company.update_attributes(params[:company])
    if @company.make_ready_for_review
      redirect_to campaign_company_path(@campaign), :notice => 'Company info is complete.'
    else
      render :new, :error => 'Correct the data to make this complete.'
    end
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
  end

  def display
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
  end

  private

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:logo_url] = 'http://placehold.it/100x100'
      params[:photo_url] = 'http://placehold.it/300x150'
      params[:banner_photo_url] = 'http://placehold.it/1500x400'

      params
    else
      params
    end
  end
end

