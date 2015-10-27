class AddRaceIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :race_id, :integer
  end
end
