class State < ActiveRecord::Base
  has_many :locations
  validates_presence_of :name
	
end
