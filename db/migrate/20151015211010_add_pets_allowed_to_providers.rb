class AddPetsAllowedToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :pets_allowed, :integer
  end
end
