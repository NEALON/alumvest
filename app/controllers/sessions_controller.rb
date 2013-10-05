class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    if @user.profile_complete
      redirect_to root_url, flash: {:success => "Signed in!" }
    else
      redirect_to user_path(@user.id), flash: {:warning => "Please complete your profile. Click 'Edit Profile' to start."}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, flash: {:success => "Signed out!"}
  end

  def failure
    redirect_to root_url, flash: {:danger => "Authentication failed, please try again."}
  end
end
