class ChangeStringToTextInBookings < ActiveRecord::Migration
  def change
  	change_column :bookings, :user_message, :text
  end
end
