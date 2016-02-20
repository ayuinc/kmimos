

class Api::ProvidersController < ApplicationController

 before_filter :set_headers

 skip_before_action :verify_authenticity_token

 def get_providers

   hash_response = Array.new
   
   @location_id = params[:location_id]

   if @location_id == "0"
     @providers = Provider.where(active: true)
     @providers = @providers.where(id: State.where(country_id: current_country.id).map{|state| state.locations.map{|location| location.providers.map{|provider| provider.id}}}.flatten) if current_country != nil
     @providers = @providers.where(id: Rate.where("price > ?", 0).map{|rate| rate.provider_id}.flatten) if !@providers.empty?
   else
     @state = State.where(country_id: current_country)
     @providers = Location.find(@location_id).providers if !@location_id.empty?
     @providers = Provider.where(id: @state.locations.map{|location| location.providers.map{|provider| provider.id}}.flatten) if @location_id.empty?
     @providers = @providers.where(id: Rate.where("price > ?", 0).map{|rate| rate.provider_id}.flatten) if !@providers.empty?
     @providers = @providers.where(active: true) if @providers != nil
   end
   
   @providers.each do |provider|
     hash_provider = Hash.new
     
     hash_provider[:id]           = provider.id
     hash_provider[:isFavorite]   = provider.is_favorite
     hash_provider[:name]         = "#{provider.name} #{provider.last_name_1} #{provider.last_name_2}"
     hash_provider[:states]       = provider.locations.map{|l| l.state.name}.uniq
     hash_provider[:longitude]    = provider.longitude
     hash_provider[:latitude]     = provider.latitude
     hash_provider[:coords]       = {latitude: provider.latitude, longitude: provider.longitude }
     hash_provider[:locations]    = provider.locations.map{|l| l.name}.uniq
     hash_provider[:description]  = provider.description
     hash_provider[:price]        = provider.rates.where("price>0").minimum(:price).to_f * 1.2
     hash_provider[:avatar]       = provider.avatar.url == nil ? "assets/user.jpg" : provider.avatar.url
     hash_provider[:sizes]        = provider.sizes.map{|s| s.size_title}.uniq
     hash_provider[:pet_qty]      = provider.pets_allowed.to_i
     hash_provider[:services]     = provider.services.map{|s| s.service_name}.uniq
     hash_provider[:comments]     = provider.comments
     hash_provider[:valuation]    = provider.get_valoration.to_i

     hash_response << hash_provider
   end
   
   respond_to do |format|
     format.json { render json: hash_response.as_json,  success: true }
   end
 end
 
 def get_session_params 
   
   hash_response = { from_date:   session[:from_date], 
                     to_date:     session[:to_date], 
                     location:    session[:q_location],
                     location_id: session[:q_location_id]}
   
   respond_to do |format|
     format.json { render json: hash_response.as_json,  success: true }
   end
   
 end

 private

 def set_headers
   headers['Access-Control-Allow-Origin'] = '*'
   headers['Access-Control-Expose-Headers'] = 'ETag'
   headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
   headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
   headers['Access-Control-Max-Age'] = '86400'
 end


end
