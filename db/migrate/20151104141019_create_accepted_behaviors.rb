class CreateAcceptedBehaviors < ActiveRecord::Migration
  def change
    create_table :accepted_behaviors do |t|
      t.integer :provider_id
      t.integer :behavior_id

      t.timestamps
    end
  end
end
