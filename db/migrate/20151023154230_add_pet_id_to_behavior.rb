class AddPetIdToBehavior < ActiveRecord::Migration
  def change
    add_column :behaviors, :pet_id, :integer
  end
end
