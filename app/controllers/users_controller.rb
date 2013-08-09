class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.investor.update_attributes(params[:investor])
    @user.complete!
    render "show"
  end
end
