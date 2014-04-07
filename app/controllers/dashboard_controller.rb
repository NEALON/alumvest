class DashboardController < ApplicationController
  def index
    # XXX need to handle non-login user case
    @user = current_user
    if @user.user_type === "Investor"
      @investor = @user.investor
      @events = @investor.events.order('id DESC')
      render 'dashboard/investor'
    elsif @user.user_type === "Issuer"
      @issuer = @user.issuer
      @events = @issuer.events.order('id DESC')
      render 'dashboard/issuer'
    # else
    #   render :layout => ''
    end
  end
end
