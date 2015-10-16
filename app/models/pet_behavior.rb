class PetBehavior < ActiveRecord::Base
  has_many :providers
  
  def to_s
    behavior_name
  end
end
