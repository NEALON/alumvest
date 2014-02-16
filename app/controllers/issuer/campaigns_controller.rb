class Issuer::CampaignsController < ApplicationController

  def index
    @user = Alumvest::User::Base.find(params[:user_id])
    @issuer = @user.issuer
    @campaigns = @issuer.campaign
    render layout: 'issuers'
  end
end

