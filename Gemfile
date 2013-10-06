source 'https://rubygems.org'
#source 'http://ruby.taobao.org/'

ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.4'
gem 'rails', '3.2.13'

group :assets do
  gem 'turbo-sprockets-rails3', '~>0.3.0'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git', :branch => '3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'state_machine'

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'omniauth-identity'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'

gem 'haml-rails'
gem 'jquery-rails'
gem 'has_filepicker_image', :git => 'git://github.com/interskh/has_filepicker_image.git'
gem 'cells'
gem 'ckeditor_rails', '~> 4.1.2'
gem "cocoon"

gem 'httparty'

gem 'gibbon', :git => "git://github.com/amro/gibbon.git" # mailchimp

gem 'puma'
gem 'activerecord-jdbcpostgresql-adapter'

group :development do
  gem 'better_errors'
  gem 'html2haml', '2.0.0.beta.1'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'nifty-generators'
end

group :development, :test do
  gem 'factory_girl_rails', :require => false
  gem 'rspec'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'selenium-webdriver'
end

gem 'jquery-ui-rails' # may not be needed - MP
gem 'compass-rails' # may not be needed - MP
gem 'rails_12factor'
# gem 'mocha', :group => :test

# gem "rails_admin", git: "git@github.com:bulleric/rails_admin.git", branch: "bootstrap2-dependency-patch"

gem 'faker'

gem 'exception_notification', :group => :production
