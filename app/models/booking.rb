# == Schema Information
#
# Table name: bookings
#
#  id               :integer          not null, primary key
#  start_date       :date
#  end_date         :date
#  provider_id      :integer
#  user_first_name  :string(255)
#  user_last_name   :string(255)

#  user_phone       :string(255)
 
#  user_email       :string(255)
#  user_message     :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  ref_code         :string(255)
#  raza             :string(255)
#  edad             :string(255)
#  cuidado_especial :text
#  token            :string(255)
#  address          :string(255)
#  pickup_time      :datetime
#  dropoff_time     :datetime
#  pet_name         :string(255)
#

class Booking < ActiveRecord::Base
	include Tokenable
	include ResetTokenable
  
  belongs_to :provider
  belongs_to :user
  
  #validates_presence_of :user_email, :user_first_name, :user_last_name, :pet_name, :provider_id, :user_phone, :raza, :edad, :address
  
  has_many :booked_pets
  has_many :pets, :through => :booked_pets
  accepts_nested_attributes_for :booked_pets
  
  has_many :booked_services
  has_many :services, :through => :booked_services
  accepts_nested_attributes_for :booked_services
  
  state_machine :state, :initial => :created do
    
  end
  
  def to_param
    token
  end
  
  def pets_list
    self.pets.map{|pet| pet.name}.join(', ')
  end
   
end
