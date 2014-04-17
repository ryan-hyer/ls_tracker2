source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '4.0.4'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development do
  gem 'quiet_assets'
  gem 'rails_best_practices'
  gem 'rack-mini-profiler'
  gem 'bullet'
  gem 'better_errors'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'pry'
  gem 'sqlite3'
end

gem 'bootstrap-sass', '~> 3.1.1.0'
gem 'sprockets', '2.11.0'
gem 'bcrypt-ruby', '3.1.2'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end