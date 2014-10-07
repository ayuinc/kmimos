class ProvidersSessionsController < ApplicationController
  before_action :require_unlogged_provider, only: [:new]

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.find_by_email(params[:email])
    if @provider && @provider.authenticate(params[:password])
      session[:provider_id] = @provider.id
      redirect_to root_url
    else
      flash.now[:error] = "Correo electrónico o contraseña inválidos."
      render 'new'
    end
  end

  def destroy
    session[:provider_id] = nil
    redirect_to root_path
  end
end
