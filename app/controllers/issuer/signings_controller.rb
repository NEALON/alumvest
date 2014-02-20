class Issuer::SigningsController < ApplicationController

  def index
    @user = UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @signings = SigningBase.investor_signature_approved
    render layout: 'issuers'
  end
end

