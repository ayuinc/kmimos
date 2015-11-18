class RemoveUserPhoneToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :user_phone, :string
  end
end
