class SettingsController < ApplicationController
  def show
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    authorize! :read, @user
    @active = 'settings_info'
  end

  def edit
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    authorize! :manage, @user
    @active = 'settings_info'
  end

  def update
    @user = Alumvest::UserBase.find(params[:user_id])
    authorize! :manage, @user
    @identity = Alumvest::Identity.find(@user.uid)
    @identity.password = params[:alumvest_user_base]["password"]
    @identity.password_confirmation = params[:alumvest_user_base]["password_confirmation"]
    if @identity.save
      notice = 'Password info saved.'
    else
      notice = 'Password info failed to update.'
      return redirect_to edit_user_settings_path(@user), :flash => {:warning => notice}
    end
    redirect_to edit_user_settings_path, :flash => {:success => notice}
  end
end
