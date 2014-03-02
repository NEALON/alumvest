class DashboardsController < ApplicationController
  def index

  end

  def show
    @user = UserBase.find(params[:user_id])
    @investor = @user.investor || Alumvest::Issuer::Base.new(:user => @user)
    authorize! :read, @investor
  end
end
