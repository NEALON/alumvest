class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @active = 'basic_info'
    render :layout => "users"
  end

  def edit
    @user = User.find_by_id(params[:id])
    @active = 'basic_info'
    render :layout => "users"
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:user])
    if @user.valid?
      redirect_to user_path, :flash => {:success => 'User info saved.'}
    else
      render :action => :edit
    end
  end
end
