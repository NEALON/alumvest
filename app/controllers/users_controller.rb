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
    unless params[:user].has_key? "user_type"
      @user.complete!
    end
    notice = 'User info saved.'
    redirect_to user_path, :flash => {:success => notice}
  end
end
