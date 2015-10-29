class AddBehaviorsAcceptedToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :behaviors_accepted, :string
  end
end
