class SettingsController < ApplicationController
  def show
    @user = UserBase.find_by_id(params[:user_id])
    @active = 'settings_info'
    render :layout => "users"
  end

  def edit
    @user = UserBase.find_by_id(params[:user_id])
    @active = 'settings_info'
    render :layout => "users"
  end

  def update
    @user = UserBase.find(params[:user_id])
    @identity = Alumvest::Identity.find(@user.uid)
    @identity.password = params[:alumvest_user_base]["password"]
    @identity.password_confirmation = params[:alumvest_user_base]["password_confirmation"]
    if @identity.save
      notice = 'Password info saved.'
    else
      notice = 'Password info failed to update.'
      return redirect_to edit_user_settings_path(@user), :flash => {:warning => notice}
    end
    redirect_to user_settings_path, :flash => {:success => notice}
  end
end
