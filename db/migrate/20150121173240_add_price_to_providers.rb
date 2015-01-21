class AddPriceToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :price, :float
  end
end
