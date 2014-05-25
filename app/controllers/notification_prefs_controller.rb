class NotificationPrefsController < ApplicationController

  def edit
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    authorize! :manage, @user
  end

  def update
    @user = Alumvest::UserBase.find(params[:user_id])
    authorize! :manage, @user
    @user.update_attributes(params[:alumvest_user_base])
    @user.save
    redirect_to edit_user_notification_prefs_path, :flash => {:success => 'Notification preferences were saved.'}
  end
end
