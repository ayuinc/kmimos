# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country_id :integer
#

class State < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :country
  has_many :locations
  
  # scope :cities_by_name, -> { locations.order(utf_name: :desc) }
end
