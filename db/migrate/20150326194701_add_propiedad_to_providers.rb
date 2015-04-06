class AddPropiedadToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :tipo_propiedad, :string
    add_column :providers, :areas_externas, :string
    add_column :providers, :emergencia, :boolean
    add_column :providers, :experiencia, :integer
  end
end
