class BookedService < ActiveRecord::Base
  
  belongs_to :service
  belongs_to :booking
  belongs_to :pet
end
