class Issuer::SigningsController < ApplicationController

  def index
    @user = Alumvest::UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @signings = Alumvest::SigningBase.investor_signature_approved
  end
end