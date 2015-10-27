class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
    
  
  
  
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
    'kmimos-ivandevp.c9.io' => 'México'
  }
  
 
  def set_locale
    I18n.locale = current_country != nil ? current_country.locale : I18n.default_locale
  end  
  
  protected

    def authenticate_admin_user!
      redirect_to(new_user_session_path) unless current_user.try(:admin?)
    end
  
   
  
  helper_method :current_country
  def current_country
    Country.first 
  end
    #if Rails.env.development?
      #Country.first
      #elsif ENV['MANUAL_DEFAULT'] == 'on'
    
    #else
      #if session[:country] == nil || session[:country] != HOSTS_MAPPING[request.host]
      #  current_country = HOSTS_MAPPING[request.host] != nil ? HOSTS_MAPPING[request.host] : "la"
      #  session[:country] = current_country != "la" ? current_country : nil 
      #end
      #return Country.find_by_name(session[:country])
      #end
  
   
end
