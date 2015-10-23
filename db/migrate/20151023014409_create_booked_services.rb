class CreateBookedServices < ActiveRecord::Migration
  def change
    create_table :booked_services do |t|
      t.integer :booking_id
      t.integer :service_id

      t.timestamps
    end
  end
end
