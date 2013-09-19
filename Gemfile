source 'https://rubygems.org'
#source 'http://ruby.taobao.org/'  ## replaceable gem source when stay in China

ruby '2.0.0'
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
gem 'formtastic'
gem 'has_filepicker_image', :git => 'git://github.com/polmiro/has_filepicker_image.git'
gem 'ckeditor_rails', '~> 4.1.2'
gem "cocoon"

gem 'httparty'

gem 'gibbon', :git => "git://github.com/amro/gibbon.git" # mailchimp

gem 'thin'
gem 'pg'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'html2haml'
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
  gem 'sqlite3'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'zeus'
end

gem 'jquery-ui-rails' # may not be needed - MP
gem 'compass-rails' # may not be needed - MP

# gem 'mocha', :group => :test

# gem "rails_admin", git: "git@github.com:bulleric/rails_admin.git", branch: "bootstrap2-dependency-patch"

gem 'paper_trail'
gem 'faker'

gem 'exception_notification', :group => :production
