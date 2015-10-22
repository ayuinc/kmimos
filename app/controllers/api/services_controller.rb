class Api::ServicesController < ApplicationController
  
  def get_services
    hash_response = Array.new
    @services = Service.all
    
    respond_to do |format|
      format.json { render json: @services.as_json,  success: true }
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
