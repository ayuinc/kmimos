class State < ActiveRecord::Base
  validates_presence_of :name
  has_many :locations
  # scope :cities_by_name, -> { locations.order(utf_name: :dessc) }
	
end
