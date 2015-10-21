class CreateBehaviors < ActiveRecord::Migration
  def change
    create_table :behaviors do |t|
      t.string :behavior_name

      t.timestamps
    end
  end
end
