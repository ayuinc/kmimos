class AddProviderIdToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :provider_id, :integer
  end
end
