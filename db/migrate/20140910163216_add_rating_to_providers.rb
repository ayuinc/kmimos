class AddRatingToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :avg_rating, :float
    add_column :providers, :picture_url, :string
    add_column :providers, :phone, :string
    add_column :providers, :price, :float
  end
end
