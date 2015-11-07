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

    price = additional_services.min(:price).to_i

    return price
  end

end
