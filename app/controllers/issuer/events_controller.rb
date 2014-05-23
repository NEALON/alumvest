class Issuer::EventsController < ApplicationController

  def index
    @user = Alumvest::UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @events = @issuer.events.order('id DESC')
  end
end