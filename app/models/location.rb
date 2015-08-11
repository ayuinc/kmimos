# == Schema Information
#
# Table name: locations
#
#  id       :integer          not null, primary key
#  name     :string(255)
#  state_id :integer
#  utf_name :string(255)
#

class Location < ActiveRecord::Base
  has_many :localizations
  has_many :providers, :through => :localizations
  belongs_to :state

	scope :order, -> { order('locations.utf_name ASC') }

  validates_presence_of :name

  def utfs
    locations.all
  end

  def find_localizations_by_provider(provider_id, location_id)
    self.localizations.where('provider_id = ? AND location_id = ?', provider_id, location_id).first
  end
	
end
