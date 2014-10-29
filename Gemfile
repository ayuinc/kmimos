source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem "pg", "~> 0.17.1"
# gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'ransack'
gem 'unicorn'


gem 'carrierwave'
# gem 'rmagick', '2.13.3', :require => 'RMagick'
gem 'fog'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

group :development do
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'guard-cucumber'
  gem 'spring', '~> 1.1.2'
  gem 'spring-commands-rspec', '~> 1.0.2'
  gem 'spring-commands-cucumber', '~> 1.0.1'
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'rb-fsevent'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'foreman'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem "poltergeist", "1.5.0"
  gem 'capybara', '2.1.0'
  gem 'simplecov', :require => false
  gem "zeus", "0.13.3"
  gem 'factory_girl_rails', '4.2.1'
  gem 'launchy'
  gem 'shoulda-matchers'
end
