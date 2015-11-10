class User::SessionsController < Devise::SessionsController
   

  def create
     user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      redirect_to '/'
    else
      #flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

 
end