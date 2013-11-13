class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    @active = 'basic_info'
  end

  def settings
    @user = User.find_by_id(params[:user_id])
    @active = 'settings'
  end

  def edit_settings
    @user = User.find_by_id(params[:user_id])
    @active = 'settings'
  end

  def edit
    @user = User.find_by_id(params[:id])
    @active = 'basic_info'
  end

  def update
    @user = User.find_by_id(params[:id])
    if current_user != nil && @user.id == current_user.id
      if params[:user].has_key? "password"
        @identity = Identity.find(@user.uid)
        @identity.password = params[:user]["password"]
        @identity.password_confirmation = params[:user]["password_confirmation"]
        if @identity.save
          notice = 'Password info saved.'
        else
          notice = 'Password info failed to update.'
          return redirect_to user_edit_settings_path(@user), :flash => {:warning => notice}
        end
      else
        @user.update_attributes(params[:user])
        unless params[:user].has_key? "user_type"
          @user.complete!
        end
        notice = 'User info saved.'
      end
    end
    redirect_to user_path, :flash => {:success => notice}
  end
end
