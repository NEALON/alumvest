class UsersController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    set_active
  end

  def edit
    @user = User.find_by_id(params[:id])
    set_active
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
          return redirect_to edit_user_path(:tab => 'settings'), :flash => {:success => notice}
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

  protected

  def set_active
    if params[:tab] == 'basice_info' or
        params[:tab] == 'demographic_info' or
        params[:tab] == 'investor_profile' or
        params[:tab] == 'founder_profile' or
        params[:tab] == 'settings' or
        params[:tab] == 'notifications'
      @active = params[:tab]
    else
      @active = 'basic_info'
    end
  end
end
