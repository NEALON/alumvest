class SettingsController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @active = 'settings_info'
    render :layout => "users"
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @active = 'settings_info'
    render :layout => "users"
  end

  def update
    @user = User.find(params[:user_id])
    @identity = Identity.find(@user.uid)
    @identity.password = params[:user]["password"]
    @identity.password_confirmation = params[:user]["password_confirmation"]
    if @identity.save
      notice = 'Password info saved.'
    else
      notice = 'Password info failed to update.'
      return redirect_to edit_user_settings_path(@user), :flash => {:warning => notice}
    end
    redirect_to user_settings_path, :flash => {:success => notice}
  end
end
