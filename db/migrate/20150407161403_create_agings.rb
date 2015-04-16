class CreateAgings < ActiveRecord::Migration
  def change
    create_table :agings do |t|
      t.integer :provider_id
      t.integer :age_id
    end
  end
end
