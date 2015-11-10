class AdditionalService < ActiveRecord::Base

  has_many :sizings
  has_many :sizes, :through => :sizings

  belongs_to :provider
  belongs_to :service

  def self.get_rate(provider_id, size_id, service_id)


    price = 0


    additional_services = AdditionalService.where(service_id: service_id, provider_id: provider_id)

    additional_services.each do |service|
      service.sizes.each do |size|
        if size.id == size_id
          price = service.price
        end
      end
    end

    return price

  end

  def self.get_min_rates_for(provider_id, service_id)
    price = 0
    additional_services = AdditionalService.where(service_id: service_id, provider_id: provider_id)

    hash_prices = Hash.new

    #price = additional_services.map{|as| as.sizes.map{|s| hash_prices[s.symbol] = as.price}} rescue 0

    price = additional_services.minimum(:price)

    return price
  end
  
  def get_pet_rate(pet_id, provider_id)
    pet=Pet.find(pet_id)
    provider = Provider.find(provider_id)

    rate = Rate.where(provider_id: provider.id, size_id: pet.size_id).last


    price = rate.price rescue 0

    response = {provider_name: provider.to_s, pet_name: pet.to_s, price: price}

    respond_to do |format|
      format.json { render json: response.as_json,  success: true }
    end
  end

end
