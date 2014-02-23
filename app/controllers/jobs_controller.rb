class JobsController < ApplicationController

  def index
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @job = Alumvest::Job.new(:company => @company)
    @jobs = @company.try(:jobs)
  end

  def new
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @job = Alumvest::Job.new(:company => @company)
  end

  def create
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @job = Alumvest::Job.create(params[:alumvest_job])
    if @job.valid?
      redirect_to campaign_company_jobs_path(@campaign), :flash => {:success => 'Company job saved.' }
    else
      render :action => :new
    end
  end

  def edit
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @job = Alumvest::Job.find(params[:id])

    render :edit
  end

  def update
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @job = Alumvest::Job.find(params[:id])
    @job.update_attributes(params[:alumvest_job])
    if @job.valid?
      redirect_to campaign_company_jobs_path(@campaign), :flash => {:success => 'Company job saved.' }
    else
      render :edit
    end
  end

  def destroy
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    job = Alumvest::Job.find(params[:id])
    job.destroy
    redirect_to campaign_company_jobs_path(@campaign), :flash => {:success => 'Your job was deleted.' }
  end
end
