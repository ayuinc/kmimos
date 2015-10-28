class AddIsFavoriteToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :is_favorite, :boolean
  end
end
