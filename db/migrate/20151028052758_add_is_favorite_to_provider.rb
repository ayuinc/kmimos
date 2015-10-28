class AddIsFavoriteToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :is_favorite, :bool
  end
end
