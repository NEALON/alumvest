class Issuer::CampaignsController < ApplicationController

  def show
    @user = UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @campaign = @issuer.campaign
    render :layout =>'issuers'
  end

  def create
    user = UserBase.find(params[:user_id])
    campaign = CampaignBase.create(
        :issuer => user.issuer)
    redirect_to new_campaign_company_path(campaign)
  end
end

