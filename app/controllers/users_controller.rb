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
      if params[:user].has_key? "password"
        @identity = Identity.find(@user.uid)
        @identity.password = params[:user]["password"]
        @identity.password_confirmation = params[:user]["password_confirmation"]
        if @identity.save
          notice = 'Password info saved.'
        else
          notice = 'Password info failed to update.'
          return redirect_to edit_user_path(:tab => 'settings'), :notice => notice
        end
      else
        @user.update_attributes(params[:user])
        @user.complete!
        notice = 'User info saved.'
      end
    end
    redirect_to user_path, :notice => notice
  end
end
