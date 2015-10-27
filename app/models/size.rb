# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  size_title :string(255)
#

class Size < ActiveRecord::Base
	has_many :sizings
  has_many :own_sizings
	has_many :providers, :through => :sizings
  has_many :additional_services
  has_many :rates
  has_many :pets
  
  has_many :booked_pets
  
  
  def to_s
    "#{size_title}          #{min_size} cm  - #{max_size} cm"
  end
end
