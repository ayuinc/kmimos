class AddUserIdToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :user_id, :integer
  end
end
