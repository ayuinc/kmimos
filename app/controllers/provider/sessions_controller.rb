class Provider::SessionsController < Devise::SessionsController
   

  def create
    @provider = Provider.find_for_database_authentication(email: params[:user][:email].downcase)
    if @provider && @provider.valid_password?(params[:user][:password])
      # Sign the user in and redirect to the user's show page.
      redirect_to '/'
    else
      #flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

 
end


def create
  @user = User.find_for_database_authentication(email: params[:user][:email].downcase)
  if @user && @user.valid_password?(params[:user][:password])
    sign_in(@user)
    redirect_to '/'
  else
    #flash.now[:error] = 'Invalid email/password combination' # Not quite right!
    render 'new'
  end
end