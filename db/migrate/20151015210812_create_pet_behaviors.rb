class CreatePetBehaviors < ActiveRecord::Migration
  def change
    create_table :pet_behaviors do |t|
      t.string :behavior_name

      t.timestamps
    end
  end
end
