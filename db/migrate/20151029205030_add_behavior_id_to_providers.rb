class AddBehaviorIdToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :behavior_id, :integer
  end
end
