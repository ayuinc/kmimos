class Api::ProvidersController < ApplicationController
  
  def get_providers
    return @providers.all.to_json
  end
  
  
  
end
