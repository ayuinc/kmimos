class DropAlbums < ActiveRecord::Migration
  def change
  	drop_table :albums
  end
end
