class Issuer::CampaignsController < ApplicationController

  def index
    @user = Alumvest::User::Base.find(params[:user_id])
    @issuer = @user.issuer
    @campaigns = @issuer.campaigns.order('id DESC')
    render layout: 'issuers'
  end
end

