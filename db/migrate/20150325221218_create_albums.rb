class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :provider, index: true
    end
  end
end
