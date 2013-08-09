Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, fields: [:first_name, :last_name, :email, :user_type], on_failed_registration: lambda { |env|
      IdentitiesController.action(:new).call(env)
    }
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  # provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  # provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
end
