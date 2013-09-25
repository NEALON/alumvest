class JobsController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @job = Job.new(:company => @company)
    @jobs = @company.try(:jobs)
  end

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @job = Job.new(:company => @company)
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @job = Job.create(params[:job])
    if @job.valid?
      redirect_to campaign_company_jobs_path(@campaign), :flash => {:success => 'Company job saved.' }
    else
      render :action => :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @job = Job.find(params[:id])

    render :edit
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @job = Job.find(params[:id])
    @job.update_attributes(params[:job])
    if @job.valid?
      redirect_to campaign_company_jobs_path(@campaign), :flash => {:success => 'Company job saved.' }
    else
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    job = Job.find(params[:id])
    job.destroy
    redirect_to campaign_company_jobs_path(@campaign), :flash => {:success => 'Your job was deleted.' }
  end
end
