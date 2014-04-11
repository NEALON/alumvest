# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'email_spec'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'factory_girl_rails'
require 'vcr'
require 'veritax_orders'
include VeritaxOrders

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
end
WebMock.allow_net_connect!

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.fail_fast = true
  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.include Features::SessionHelpers, :type => :feature
  config.include Features::OmniAuthHelpers, :type => :feature
  config.include Features::FormHelpers, :type => :feature
  config.include Features::WorkflowStepHelpers, :type => :feature
  config.include Features::FactoryHelpers, :type => :feature

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.before(:each, :type => :feature) do
    # page.driver.browser.manage.window.resize_to(1600,1000)
    # page.driver.browser.manage.window.maximize
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
