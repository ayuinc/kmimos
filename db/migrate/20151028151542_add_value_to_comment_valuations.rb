class AddValueToCommentValuations < ActiveRecord::Migration
  def change
    add_column :comment_valuations, :value, :integer
  end
end
