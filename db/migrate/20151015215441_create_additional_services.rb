class CreateAdditionalServices < ActiveRecord::Migration
  def change
    create_table :additional_services do |t|
      t.integer :service_id
      t.integer :provider_id
      t.integer :size_id
      t.float :price

      t.timestamps
    end
  end
end
