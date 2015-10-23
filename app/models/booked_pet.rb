class BookedPet < ActiveRecord::Base
  
  belongs_to :booking
  belongs_to :pet
  
end
