class RemoveUserEmailToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :user_email, :string
  end
end
