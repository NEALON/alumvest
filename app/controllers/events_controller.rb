class EventsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @events = @investor.events.order('id DESC')
    render layout: 'investors'
  end
end

