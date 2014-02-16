class IssuerEventsController < ApplicationController

  def index
    @user = Alumvest::User::Base.find(params[:user_id])
    @issuer = @user.issuer
    @events = @issuer.events.order('id DESC')
    render layout: 'issuers'
  end
end

