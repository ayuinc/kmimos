# == Schema Information
#
# Table name: sizes
#
#  id         :integer          not null, primary key
#  size_title :string(255)
#

class Size < ActiveRecord::Base
	has_many :sizings
	has_many :providers, :through => :sizings
end
