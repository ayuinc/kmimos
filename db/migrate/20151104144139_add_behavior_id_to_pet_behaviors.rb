class AddBehaviorIdToPetBehaviors < ActiveRecord::Migration
  def change
    add_column :pet_behaviors, :behavior_id, :integer
  end
end
