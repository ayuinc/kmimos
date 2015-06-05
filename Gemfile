
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

gem "pg", "~> 0.17.1"
#gem 'sqlite3'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# gem 'bootstrap-datepicker-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0.3'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'ransack'
gem 'unicorn'
gem 'sort_alphabetical'


gem 'carrierwave'
gem 'rmagick', '2.13.3', :require => 'RMagick'
gem 'fog', '~> 1.24.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

group :development do
  gem 'faker'
  gem 'guard-livereload'
  gem 'guard-bundler'
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
  gem 'foreman'
  gem 'autotest-rails'
  gem 'capybara'
  gem 'shoulda'
  gem 'byebug'
end