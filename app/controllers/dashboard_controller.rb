class DashboardController < ApplicationController
  def index
    # TODO: need to handle non-login user case
    @user = current_user
    if @user.user_type === "Investor"
      @investor = @user.investor
      @events = @investor.events.order('id DESC')
      render 'dashboard/investor'
    end
  end
end
