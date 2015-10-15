class AdditionalService < ActiveRecord::Base
  
  has_many :sizings
  has_many :sizes, :through => :sizings
  
  belongs_to :provider
  belongs_to :service
end
