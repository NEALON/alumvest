class Investor::EventsController < ApplicationController

  def index
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor
    @events = @investor.events.order('id DESC')
    render :layout => 'investors'
  end
end

