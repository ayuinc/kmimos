class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.string :name
      t.float :min_weight
      t.float :max_weight

      t.timestamps
    end
  end
end
