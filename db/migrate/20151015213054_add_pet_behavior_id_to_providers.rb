class AddPetBehaviorIdToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :pet_behavior_id, :integer
  end
end
