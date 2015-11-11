class RemoveSizeFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :size, :float
  end
end
