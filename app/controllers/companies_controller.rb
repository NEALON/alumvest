class CompaniesController < ApplicationController
  before_filter :check_issuer, :except => [:display, :show]

  def check_issuer
    @campaign = CampaignBase.find(params[:campaign_id])
    authorize! :manage, @campaign
  end

  def new
    @company = CompanyBase.new(:campaign => @campaign)
  end

  def create
    @company = CompanyBase.create(add_images_if_test!(params[:alumvest_company_base]))
    if @company.valid?
      redirect_to campaign_company_path(@campaign), :flash => {:success => 'Company saved.' }
    else
      render :action => :new
    end
  end

  def edit
    @company = @campaign.company
    render :new
  end

  def update
    @company = @campaign.company
    @company.update_attributes(add_images_if_test!(params[:alumvest_company_base]))
    if @company.valid?
      redirect_to campaign_company_path(@campaign), :flash => {:success => 'Company saved.' }
    else
      render :new, :warning => 'Correct the data to make this complete.'
    end
  end

  def check_for_completeness
    @company = @campaign.company
    if @company.make_ready_for_review
      redirect_to campaign_company_path(@campaign), :flash => {:success => 'Company info is complete.' }
    else
      render :new, :warning => 'Correct the data to make this complete.'
    end
  end

  def preview
    @company = @campaign.company
    @is_preview = true
    render 'display'
  end

  def show
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
  end

  def display
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment_term = @campaign.investment_term
    @updates = @company.updates
    @jobs = @company.jobs
  end

  private

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:logo_url] = 'http://placehold.it/100x100'
      params[:photo_url] = 'http://placehold.it/300x150'
      params[:banner_photo_url] = 'http://placehold.it/1500x400.gif'

      params
    else
      params
    end
  end
end

