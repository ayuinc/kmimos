class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :size_title
      t.integer :provider_id
    end
  end
end
