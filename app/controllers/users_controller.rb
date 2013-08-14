class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    if params[:tab] == 'basice_info' or
        params[:tab] == 'advanced_info' or
        params[:tab] == 'investor_profile' or
        params[:tab] == 'founder_profile' or
        params[:tab] == 'settings' or
        params[:tab] == 'notifications' or
        params[:tab] == 'bank_account'
      @active = params[:tab]
    else
      @active = 'basic_info'
    end
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @current_user != nil and @user.id == @current_user.id
      @user.update_attributes(params[:user])
      #@user.investor.update_attributes(params[:investor]) if @user.is_investor?
      #@user.owner.update_attributes(params[:owner]) if @user.is_owner?
      @user.complete!
    end
    render "show"
  end
end
