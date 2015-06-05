class AddUtfNameToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :utf_name, :string
  end
end
