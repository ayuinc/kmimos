class ChangePropiedadIdInProviders < ActiveRecord::Migration
  def change
  	remove_column :providers, :propiedad_id
  	add_column :providers, :property_id, :integer
  end
end
