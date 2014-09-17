class Location < ActiveRecord::Base
  has_many :localizations
  has_many :providers, :through => :localizations

  validates_presence_of :name

  def find_localizations_by_provider(provider_id, location_id)
    self.localizations.where('provider_id = ? AND location_id = ?', provider_id, location_id).first
  end
	
end
