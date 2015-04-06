class AddCodigoToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :ref_code, :string
  end
end
