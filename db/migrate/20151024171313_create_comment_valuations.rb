class CreateCommentValuations < ActiveRecord::Migration
  def change
    create_table :comment_valuations do |t|
      t.integer :comment_id
      t.integer :valuation_id

      t.timestamps
    end
  end
end
