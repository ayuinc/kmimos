class AddDescriptionToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :description, :text
    remove_column :providers, :price
  end
end
