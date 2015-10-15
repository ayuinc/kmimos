class AddHasGreenAreasToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :has_green, :boolean
  end
end
