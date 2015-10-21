class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :race
      t.integer :age
      t.float :size
      t.float :weight
      t.string :sex
      t.integer :behavior_id

      t.timestamps
    end
  end
end
