class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ProvidersSessions
  include Bookings
  helper_method :current_provider
  helper_method :current_provider?

end
