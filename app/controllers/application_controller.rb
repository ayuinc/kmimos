class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ProvidersSessions
  include Bookings
  helper_method :current_provider
  helper_method :current_provider?
  helper_method :current_country
  before_action :set_locale
  
  HOSTS_MAPPING = {
    'kmimos.la' => 'la',
    'www.kmimos.la' => 'la',
    'mx.kmimos.la' => 'México',
    'cani.mx' => 'México',
    'kmimos.com.mx' => 'México',
    'www.cani.mx' => 'México',
    'www.kmimos.com.mx' => 'México',
    'ar.kmimos.la' => 'Argentina',
    'pa.kmimos.la' => 'Panamá',
    'dry-oasis-5911.herokuapp.com' => 'México',
    'mx1.kmimos.la' => 'México'
  }
 
  def set_locale
    I18n.locale = current_country != nil ? current_country.locale : I18n.default_locale
  end  
  
  def current_country
    if session[:country] == nil || session[:country] != HOSTS_MAPPING[request.host]
      current_country = HOSTS_MAPPING[request.host] != nil ? HOSTS_MAPPING[request.host] : "la"
      if current_country != "la"
        session[:country] = current_country
      else
        session[:country] = nil
      end
    end
    return Country.find_by_name(session[:country])
  end

end
