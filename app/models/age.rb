# == Schema Information
#
# Table name: ages
#
#  id             :integer          not null, primary key
#  age_group_name :string(255)
#

class Age < ActiveRecord::Base
  has_many :agings
  has_many :providers, :through => :agings
  has_many :pets
  
  def to_s
    age_group_name
  end
end
