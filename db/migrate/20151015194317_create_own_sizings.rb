class CreateOwnSizings < ActiveRecord::Migration
  def change
    create_table :own_sizings do |t|
      t.integer :provider_id
      t.integer :size_id

      t.timestamps
    end
  end
end
