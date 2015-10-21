# == Schema Information
#
# Table name: localizations
#
#  id          :integer          not null, primary key
#  provider_id :integer
#  location_id :integer
#

class Localization < ActiveRecord::Base 
  belongs_to :provider  
  belongs_to :location 
end
