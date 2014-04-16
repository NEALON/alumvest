class Issuer::InvestmentsController < ApplicationController

  def index
    @user = UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @campaign = @issuer.campaign
    @investments = @campaign.investments
    render :layout => 'issuers'
  end
end

