class RemoveAgeFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :age, :integer
  end
end
