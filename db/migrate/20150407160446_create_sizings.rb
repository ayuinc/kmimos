class CreateSizings < ActiveRecord::Migration
  def change
    create_table :sizings do |t|
      t.integer :provider_id
      t.integer :size_id
    end
  end
end
