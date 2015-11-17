class RemoveUserLastNameToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :user_last_name, :string
  end
end
