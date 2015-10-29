class Behavior < ActiveRecord::Base
  has_many :pet_behavior
  has_many :pets
  has_many :providers
  
  def to_s
    behavior_name
  end
  
end
