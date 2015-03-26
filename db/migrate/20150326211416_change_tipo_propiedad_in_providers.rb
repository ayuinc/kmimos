class ChangeTipoPropiedadInProviders < ActiveRecord::Migration
  def change
  	remove_column :providers, :tipo_propiedad
  	add_column :providers, :propiedad_id, :integer
  end
end
