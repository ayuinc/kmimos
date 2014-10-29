class ProvidersSessionsController < ApplicationController
  before_action :require_unlogged_provider, only: [:new]

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.find_by_dni(params[:dni])
    if @provider && @provider.authenticate(params[:password])
      session[:provider_id] = @provider.id
      redirect_to root_url
    else
      flash[:error] = "IFE o contraseña inválidos."
      # render 'new'
      redirect_to new_providers_session_path
    end
  end

  def destroy
    session[:provider_id] = nil
    redirect_to root_path
  end
end
