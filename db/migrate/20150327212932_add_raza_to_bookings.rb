class AddRazaToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :raza, :string
    add_column :bookings, :edad, :string
    add_column :bookings, :cuidado_especial, :text
  end
end
