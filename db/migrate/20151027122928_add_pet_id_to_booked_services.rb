class AddPetIdToBookedServices < ActiveRecord::Migration
  def change
    add_column :booked_services, :pet_id, :integer
  end
end
