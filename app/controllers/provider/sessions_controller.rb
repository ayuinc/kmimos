class Provider::SessionsController < Devise::SessionsController
   

  def create
    @provider = Provider.find_for_database_authentication(email: params[:provider][:email].downcase)
    if @provider && @provider.valid_password?(params[:provider][:password]) #&& @provider.active
      sign_in(@provider)
      redirect_to session[:previous_url] || '/'
    else
      flash[:error] = 'Email o password inválido o proveedor inactivo' # Not quite right!
      render 'new' 
    end
  end
 
end