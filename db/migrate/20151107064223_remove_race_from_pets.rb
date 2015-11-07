class RemoveRaceFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :race, :string
  end
end
