class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    if @user.profile_complete
      redirect_to root_url, notice: "Signed in!"
    else
      redirect_to user_path(@user.id), notice: "Please complete your profile. Click 'edit' to start."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
