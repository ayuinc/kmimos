class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :provider_id
      t.integer :size_id
      t.float :price

      t.timestamps
    end
  end
end
