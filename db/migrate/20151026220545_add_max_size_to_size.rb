class AddMaxSizeToSize < ActiveRecord::Migration
  def change
    add_column :sizes, :max_size, :float
  end
end
