class Race < ActiveRecord::Base
  has_many :pets
  
  def to_s
    race_name
  end
  
end
