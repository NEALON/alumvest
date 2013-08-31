class CampaignsController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @user = @company.owner.user
  end

  def team
    @company = Company.find(params[:campaign_id])
    @user = @company.owner.user
  end

  def investment_term
    @company = Company.find(params[:campaign_id])
    @user = @company.owner.user
  end

  def updates
    @company = Company.find(params[:campaign_id])
    @user = @company.owner.user
  end

  def join_us
    @company = Company.find(params[:campaign_id])
    @user = @company.owner.user
  end
end
