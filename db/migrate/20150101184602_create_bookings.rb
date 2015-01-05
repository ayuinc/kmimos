class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :provider, index: true
      t.string :user_first_name
      t.string :user_last_name
      t.string :user_phone
      t.string :user_email
      t.string :user_message

      t.timestamps
    end
  end
end
