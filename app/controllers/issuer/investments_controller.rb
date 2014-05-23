class Issuer::InvestmentsController < ApplicationController

  def index
    @user = Alumvest::UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @campaign = @issuer.campaign
    @investments = @campaign.investments
  end
end

