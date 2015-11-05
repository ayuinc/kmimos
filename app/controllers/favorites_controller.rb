class FavoritesController < ApplicationController
  def new
    provider = params[:provider_id]
    user = current_user.id
    
    Favorite.new({provider_id: provider, user_id: user}).save
    redirect_to 'providers/#{provider}'
  end
  
  def create
    provider = params[:provider_id]
    user = current_user.id
    
    Favorite.new({provider_id: provider, user_id: user}).save
    redirect_to 'providers/#{provider}'
  end
end