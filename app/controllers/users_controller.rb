class UsersController < ApplicationController
  def show
    @user = Alumvest::UserBase.find_by_id(params[:id])
    @active = 'basic_info'
  end

  def edit
    @user = Alumvest::UserBase.find_by_id(params[:id])
    authorize! :manage, @user
    @active = 'basic_info'
  end

  def update
    @user = Alumvest::UserBase.find_by_id(params[:id])
    authorize! :manage, @user
    @user.update_attributes(params[:alumvest_user_base])
    if (params[:alumvest_user_base].size == 1 and params[:alumvest_user_base].has_key? :user_type) or @user.valid?
      redirect_to view_context.user_profile_entry_link(@user, true), :flash => {:success => 'User info saved.'}
    else
      render :action => :edit
    end
  end

  def update_education
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    authorize! :manage, @user
    @user.update_attributes(params[:alumvest_user_base])
    if @user.is_investor?
      redirect_to dashboard_user_investor_path(@user)
    elsif @user.is_issuer?
      redirect_to dashboard_user_issuer_path(@user)
    end
  end
end
