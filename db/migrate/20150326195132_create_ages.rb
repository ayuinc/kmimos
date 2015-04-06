class CreateAges < ActiveRecord::Migration
  def change
    create_table :ages do |t|
      t.string :age_group_name
      t.integer :provider_id
    end
  end
end
