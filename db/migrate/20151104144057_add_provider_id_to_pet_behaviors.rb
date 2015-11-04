class AddProviderIdToPetBehaviors < ActiveRecord::Migration
  def change
    add_column :pet_behaviors, :provider_id, :integer
  end
end
