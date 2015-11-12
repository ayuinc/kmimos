class User::SessionsController < Devise::SessionsController
   
  def new
    super
    @user = User.new
  end

  def create
    @user = User.find_for_database_authentication(email: params[:user][:email].downcase)
    
    if @user && @user.valid_password?(params[:user][:password])
      sign_in(@user)
      redirect_to session[:previous_url] || '/'
    else
      @user == User.new(params[:user]) if @user == nil 
      render 'new'
    end
  end
 
end
 