class CreateBookedPets < ActiveRecord::Migration
  def change
    create_table :booked_pets do |t|
      t.integer :booking_id
      t.integer :pet_id

      t.timestamps
    end
  end
end
