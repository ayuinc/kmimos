class AddOnTopToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :on_top, :bool
  end
end
