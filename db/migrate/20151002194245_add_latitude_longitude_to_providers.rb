class AddLatitudeLongitudeToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :latitude, :string, null: false
    add_column :providers, :longitude, :string, null: false
  end
end
