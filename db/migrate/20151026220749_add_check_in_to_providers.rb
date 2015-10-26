class AddCheckInToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :check_in, :time
  end
end
