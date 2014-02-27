class UsersController < ApplicationController
  def show
    @user = UserBase.find_by_id(params[:id])
    @active = 'basic_info'
    render :layout => 'users'
  end

  def edit
    @user = UserBase.find_by_id(params[:id])
    authorize! :manage, @user
    @active = 'basic_info'
    render :layout => 'users'
  end

  def update
    @user = UserBase.find_by_id(params[:id])
    authorize! :manage, @user
    @user.update_attributes(params[:alumvest_user_base])
    if (params[:alumvest_user_base].size == 1 and params[:alumvest_user_base].has_key? :user_type) or @user.valid?
      redirect_to view_context.user_profile_entry_link(@user, true), :flash => {:success => 'User info saved.'}
    else
      render :action => :edit
    end
  end
end
