ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  ENV['FROM_EMAIL'] = 'from@example.com'

  def login_as_test_user
    visit root_path
    click_link 'Log In'
    visit '/login'
    fill_in 'Email',    with: 'test@example.org'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
  end
end