class AddHasYardToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :has_yard, :boolean
  end
end
