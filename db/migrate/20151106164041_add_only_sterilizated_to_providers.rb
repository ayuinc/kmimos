class AddOnlySterilizatedToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :only_sterilizated, :bool
  end
end
