unless Rails.env.production?
  require 'capybara'

  Capybara.configure do |config|
    config.default_driver = :selenium
    config.match = :prefer_exact
    config.ignore_hidden_elements = false
    config.server_port = 8200
    config.app_host = "http://localhost:8200"
    config.default_wait_time = 6
  end

  class ActionDispatch::IntegrationTest
   include Capybara::DSL

   teardown do
     Capybara.reset_sessions!
   end
  end
end