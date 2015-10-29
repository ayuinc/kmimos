class PetsController < ApplicationController
  respond_to :html, :json
  
  def show
    @user = User.find(params[:id])
  end
  
  def update 
    @pet = Pet.find(params[:id])
    @pet.update_attributes(pet_params)   
    
    respond_to do |format| 
       format.json { respond_with @pet }
     end
  end
  
  private
  
  def pet_params
    params.require(:pet).permit!
  end
  
end