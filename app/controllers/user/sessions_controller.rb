class User::SessionsController < Devise::SessionsController
   

  def create
    @user = User.find_for_database_authentication(email: params[:user][:email].downcase)
    if @user && @user.valid_password?(params[:user][:password])
      sign_in(@user)
      redirect_to session[:previous_url] || '/'
    else
      #flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

 
end
 