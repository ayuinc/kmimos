class Behavior < ActiveRecord::Base
  has_many :pet_behavior
  has_many :pets
end
