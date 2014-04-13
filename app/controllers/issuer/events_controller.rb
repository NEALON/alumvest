class Issuer::EventsController < ApplicationController

  def index
    @user = UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @events = @issuer.events.order('id DESC')
    render :layout => 'issuers'
  end
end