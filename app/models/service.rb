class Service < ActiveRecord::Base
  has_many :additional_services
  
  def to_s  
    service_name
  end
end
