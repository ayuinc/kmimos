class AddWeightIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :weight_id, :integer
  end
end
