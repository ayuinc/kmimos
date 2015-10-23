class PetBehavior < ActiveRecord::Base
  has_many :providers
  has_many :pet 
  
  def to_s
    behavior_name
  end
end
