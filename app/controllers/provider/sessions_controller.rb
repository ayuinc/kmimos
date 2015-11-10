class Provider::SessionsController < Devise::ApplicationController
   

  def create
     provider = Provider.find_by_email(params[:session][:email].downcase)
    if provider && provider.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      redirect_to '/'
    else
      #flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

 
end