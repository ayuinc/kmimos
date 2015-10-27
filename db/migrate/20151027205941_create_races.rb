class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :race_name

      t.timestamps
    end
  end
end
