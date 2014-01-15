class EventsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @events = @investor.events
    render layout: 'investors'
  end
end

