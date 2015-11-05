class Api::BookingsController < ApplicationController
  
  before_filter :set_headers
  skip_before_action :verify_authenticity_token
  
  def get_new_booking
    
  end
  
  def get_rate
    pet=Pet.find(params[:pet])
    service = Service.find(params[:service])
    
    price = 0
     
    additional_services = AdditionalService.where(service_id: service.id)
    
    additional_services.each do |service|
      service.sizes.each do |size|
        if size.id == pet.size_id 
          price = service.price
        end
      end
    end 
     
    
    response = {service_name: service.to_s, pet_name: pet.to_s, price: price}
     
    respond_to do |format|
      format.json { render json: response.as_json,  success: true }
    end 
    
  end
  
  def get_pet_rate
    pet=Pet.find(params[:pet])
    provider = Provider.find(params[:provider])
    
    rate = Rate.where(provider_id: provider.id, size_id: pet.size_id).last
    
    
    price = rate.price rescue 0
    
    response = {provider_name: provider.to_s, pet_name: pet.to_s, price: price}
    
    respond_to do |format|
      format.json { render json: response.as_json,  success: true }
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