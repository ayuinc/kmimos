class ApplicationController < ActionController::Base
 
  include ActionController::Caching

  after_filter :store_location
  before_filter :make_action_mailer_use_request_host_and_protocol
  
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
    'cp.kmimos.la' => 'la',
    'kmimosmx.herokuapp.com' => 'México',
    'kmimos-giancorzo.c9users.io' => 'México'
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
    if Rails.env.development?
      Country.first
    else
      if session[:country] == nil || session[:country] != HOSTS_MAPPING[request.host]
       current_country = HOSTS_MAPPING[request.host] != nil ? HOSTS_MAPPING[request.host] : "la"
       session[:country] = current_country != "la" ? current_country : nil
      end
      p session[:country]
      return Country.find_by_name(session[:country])
    end
  end

  private

  def make_action_mailer_use_request_host_and_protocol
    ActionMailer::Base.default_url_options[:protocol] = request.protocol
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

end
