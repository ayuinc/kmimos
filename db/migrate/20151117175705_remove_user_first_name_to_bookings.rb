class RemoveUserFirstNameToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :user_first_name, :string
  end
end
