class AddActiveToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :active, :boolean, :default => true
  end
end
