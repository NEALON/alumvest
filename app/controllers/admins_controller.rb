class AdminsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    render :layout => 'admins'
  end
end

