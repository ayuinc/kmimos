class PetBehavior < ActiveRecord::Base
  belongs_to :provider
  has_many :pet
  belongs_to :behavior 
  
  def to_s
    behavior_name
  end
end
