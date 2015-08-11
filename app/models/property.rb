# == Schema Information
#
# Table name: properties
#
#  id            :integer          not null, primary key
#  property_name :string(255)
#

class Property < ActiveRecord::Base
	has_many :providers
end
