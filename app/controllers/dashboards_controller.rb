class DashboardsController < ApplicationController
  def index

  end

  def show
    @user = UserBase.find(params[:user_id])
    if @user.user_type === "Investor"
      render 'dashboards/investor'
    elsif @user.user_type === "Issuer"
      render 'dashboards/issuer'
    # else
    #   render :layout => ''
    end

  end
end
