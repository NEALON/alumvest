class UpdatesController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @update = Update.new(:company => @company)
    @updates = @company.try(:updates)
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @update = Update.new(:company => @company)
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @update = Update.create(params[:update])
    if @update.valid?
      redirect_to campaign_company_updates_path(@campaign), :flash => {:success => 'Company update saved.' }
    else
      render :action => :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @update = Update.find(params[:id])

    render :new
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @update = Update.find(params[:id])
    @update.update_attributes(params[:update])
    if @update.valid?
      redirect_to campaign_company_updates_path(@campaign), :flash => {:success => 'Company update saved.' }
    else
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    update = Update.find(params[:id])
    update.destroy
    redirect_to campaign_company_updates_path(@campaign), :flash => {:success => 'Your update was deleted.' }
  end
end
