class AddPlaceNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :place_name, :string
  end
end
