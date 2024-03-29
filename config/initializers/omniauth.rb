Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity,
           model: Alumvest::Identity,
           fields: [:first_name, :last_name, :email, :description],
           on_failed_registration: lambda { |env|
             IdentitiesController.action(:new).call(env)
           }

  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  # provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']

  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
end
