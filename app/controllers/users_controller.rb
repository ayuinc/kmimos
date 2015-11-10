  class UsersController < ApplicationController
    respond_to :html, :json
    
    
    
    def show
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      @user.update_attributes(user_params)  
      
      respond_to do |format|
         format.html { redirect_to :acton => :show }
         format.json { respond_with @user }
       end
    end
    
    private
    
    def user_params
      params.require(:user).permit!
    end
    
  end