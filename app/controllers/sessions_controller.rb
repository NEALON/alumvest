class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
  end

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id

    if @user.is_admin?
      redirect_to "/admin_dashboard"
    else
      if @user.profile_complete?
        if @user.is_owner?
          redirect_to "/owner_dashboard"
        else
          redirect_to root_url, flash: {:success => "Signed in!"}
        end
      else
        redirect_to edit_user_path(@user)
      end
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
