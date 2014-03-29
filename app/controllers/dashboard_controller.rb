class DashboardController < ApplicationController
  def index
    @user = current_user
    if @user.user_type === "Investor"
      render 'dashboard/investor'
    elsif @user.user_type === "Issuer"
      render 'dashboard/issuer'
    # else
    #   render :layout => ''
    end
  end
end
