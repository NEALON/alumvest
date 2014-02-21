class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery
  helper_method :current_user, :logged_in?
  before_filter :authenticate

  InvestementBase = Alumvest::Investment::Base
  CampaignBase = Alumvest::Campaign::Base
  SigningBase = Alumvest::Signing::Base
  UserBase = Alumvest::User::Base

  def authenticate
    Rails.env == 'production' && !ENV['public'] && authenticate_or_request_with_http_basic do |username, password|
      username == "chen" && password == "ling"
    end
  end

  private

  def current_user
    @current_user ||= begin
      if session[:user_id]
        Alumvest::User::Base.find(session[:user_id])
      end
    rescue
      nil
    end
  end

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logged_in?
    !!current_user
  end
end
