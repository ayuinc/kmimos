class AddSizeIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :size_id, :integer
  end
end
