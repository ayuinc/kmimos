class AddAdressToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :address, :string
    add_column :bookings, :pickup_time, :datetime
    add_column :bookings, :dropoff_time, :datetime
    add_column :bookings, :pet_name, :string
  end
end
