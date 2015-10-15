class AddNumberOfPetsToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :number_of_pets, :integer
  end
end
