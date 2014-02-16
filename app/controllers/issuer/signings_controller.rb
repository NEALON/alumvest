class Issuer::SigningsController < ApplicationController

  def index
    @user = Alumvest::User::Base.find(params[:user_id])
    @issuer = @user.issuer
    @signings = Alumvest::Signing::Base.investor_signature_approved
    render layout: 'issuers'
  end
end

