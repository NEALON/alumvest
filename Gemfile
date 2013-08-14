source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '3.2.13'

group :assets do
  gem 'turbo-sprockets-rails3', '~>0.3.0'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'bcrypt-ruby', '~> 3.0.0'
gem 'omniauth-identity'

gem 'haml-rails'
gem 'jquery-rails'
gem 'formtastic'
gem 'has_filepicker_image', :git => 'git://github.com/polmiro/has_filepicker_image.git'
gem 'ckeditor_rails', '~> 4.1.2'
gem "cocoon"

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
  gem 'factory_girl_rails'
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

gem 'jquery-ui-rails', '~> 3.0' # RailsThemes
gem 'compass-rails' #, :group => 'assets' # RailsThemes
gem 'zurb-foundation', '~> 4.0', :group => 'assets' # RailsThemes

#gem 'mocha', :group => :test

gem 'rails_admin', :git => 'git://github.com/mikepence/rails_admin.git', :ref => 'baa51e36dd97c9cde0fddf350b22e4feff3a4e6d'
gem 'paper_trail'
gem 'faker'
