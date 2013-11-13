class DemographicsController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @demographic = @user.demographic || Demographic.create(:user => @user)
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @demographic = @user.demographic
  end
end
