Airbrake.configure do |config|
  config.api_key = 'da9b12e40cd239ca5a53c97af497c3a5'

  # Default ignore exception classes:
  #  ActiveRecord::RecordNotFound
  #  ActionController::RoutingError
  #  ActionController::InvalidAuthenticityToken
  #  CGI::Session::CookieStore::TamperedWithCookie
  #  ActionController::UnknownHttpMethod
  #  ActionController::UnknownAction
  #  AbstractController::ActionNotFound
  #  Mongoid::Errors::DocumentNotFound
  #config.ignore_only = []
end
