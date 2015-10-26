class AddCheckOutToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :check_out, :time
  end
end
