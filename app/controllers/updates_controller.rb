class UpdatesController < ApplicationController

  def index
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    authorize! :manage, @campaign
    @company = @campaign.company
    @update = Alumvest::Update.new(:company => @company)
    @updates = @company.try(:updates)
  end

  def new
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    authorize! :manage, @campaign
    @company = @campaign.company
    @update = Alumvest::Update.new(:company => @company)
  end

  def create
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    authorize! :manage, @campaign
    @company = @campaign.company
    @update = Alumvest::Update.create(params[:alumvest_update])
    if @update.valid?
      redirect_to campaign_company_updates_path(@campaign), :flash => {:success => 'Company update saved.' }
    else
      render :action => :new
    end
  end

  def edit
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    authorize! :manage, @campaign
    @company = @campaign.company
    @update = Alumvest::Update.find(params[:id])

    render :edit
  end

  def update
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    authorize! :manage, @campaign
    @company = @campaign.company
    @update = Alumvest::Update.find(params[:id])
    @update.update_attributes(params[:alumvest_update])
    if @update.valid?
      redirect_to campaign_company_updates_path(@campaign), :flash => {:success => 'Company update saved.' }
    else
      render :edit
    end
  end

  def destroy
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    authorize! :manage, @campaign
    @company = @campaign.company
    update = Alumvest::Update.find(params[:id])
    update.destroy
    redirect_to campaign_company_updates_path(@campaign), :flash => {:success => 'Your update was deleted.' }
  end
end
