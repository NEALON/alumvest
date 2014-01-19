Av::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Show full error reports and disable caching
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.delivery_method = :test
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  config.eager_load = false

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # turn this on if you want to test mail on localhost
  config.action_mailer.perform_deliveries = false

  ENV['FACEBOOK_ID'] = '595676113816940'
  ENV['FACEBOOK_SECRET'] = 'd384cebd861dd46b7b05f9c466bb57ed'

  ENV['LINKEDIN_KEY'] = 'qd5q9f8vpt8c'
  ENV['LINKEDIN_SECRET'] = 'HvAjeZ2YCkr80QVM'

  ENV['SENDGRID_USERNAME'] = 'alumvest'
  ENV['SENDGRID_PASSWORD'] = '055Hn6l60M6Kj4X'

  ENV['MAILCHIMP_API_KEY'] = '8c194cd48f5416725f97c6a9010e46dd-us7'
  ENV['MAILCHIMP_LIST_ID'] = '318a0cb2de'

  ENV['SSN_SECRET'] = 'secret'

end
