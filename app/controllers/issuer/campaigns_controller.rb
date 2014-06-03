class Issuer::CampaignsController < ApplicationController

  def show
    @user = Alumvest::UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @campaign = @issuer.campaign
    render :layout =>'issuers'
  end

  def create
    user = Alumvest::UserBase.find(params[:user_id])
    campaign = Alumvest::CampaignBase.create(
        :issuer => user.issuer)
    redirect_to new_campaign_company_path(campaign)
  end
end

