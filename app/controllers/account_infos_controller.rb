class AccountInfosController < ApplicationController

  def edit
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    authorize! :manage, @user
  end

  def update
    puts 'test'
    @user = Alumvest::UserBase.find(params[:user_id])
    authorize! :manage, @user
    @user.update_attributes(params[:alumvest_user_base])
    @user.save
    redirect_to edit_user_account_info_path, :flash => {:success => 'Notification preferences were saved.'}
  end
end
