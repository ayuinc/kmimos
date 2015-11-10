class ApplicationController < ActionController::Base
  
  include Mobylette::RespondToMobileRequests
  
  include ActionController::Caching

  after_filter :store_location

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


  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    if resource.class == User
      session[:previous_url] || '/'
    else
      return '/'
    end
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
