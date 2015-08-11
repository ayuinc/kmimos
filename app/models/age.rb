# == Schema Information
#
# Table name: ages
#
#  id             :integer          not null, primary key
#  age_group_name :string(255)
#

class Age < ActiveRecord::Base
	has_many :agings
	has_many	:providers, :through => :agings
end
