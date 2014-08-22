class StaticController < ApplicationController
  def socials
    @user = current_user
  end
  
  def founder_dashboard
    @user = current_user
  end
  
  def profile
    @user = current_user
  end
  
  def current_user
    @current_user ||= begin
      if session[:user_id]
        Alumvest::UserBase.find(session[:user_id])
      end
    rescue
      nil
    end
  end

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end
  
  def howItWorks
  end
  
  def howItWorksInvestors
    
  end
  
  def howItWorksProcess
    
  end
end