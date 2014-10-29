class AddAvatarToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :avatar, :string
  end
end
