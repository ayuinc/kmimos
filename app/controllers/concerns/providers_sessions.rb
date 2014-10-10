module ProvidersSessions
  def current_provider
    @current_provider ||= Provider.find(session[:provider_id]) if session[:provider_id]
  end

  def require_logged_in_provider
    current_provider
    redirect_to new_providers_session_path unless @current_provider
  end

  def require_current_provider
    current_provider
    redirect_to new_providers_session_path unless current_provider?
  end

  def current_provider?
    current_provider
    @provider == @current_provider
  end

  def require_unlogged_provider
    redirect_to root_path unless session[:provider_id].nil?
  end
end
