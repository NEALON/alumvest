class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
  end

  def create
    @user = Alumvest::User::Base.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id

    if @user.is_admin?
      redirect_to user_admin_path(@user)
    else
      if @user.profile_complete?
        if @user.is_issuer?
          redirect_to user_issuer_path(@user)
        else
          redirect_to root_url, flash: {:success => "Signed in!"}
        end
      else
        redirect_to view_context.user_profile_entry_link(@user)
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, flash: {:success => "Signed out!"}
  end

  def failure
    redirect_to root_url, flash: {:warning => "Authentication failed, please try again."}
  end
end
