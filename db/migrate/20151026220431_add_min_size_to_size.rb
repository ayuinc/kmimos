class AddMinSizeToSize < ActiveRecord::Migration
  def change
    add_column :sizes, :min_size, :float
  end
end
