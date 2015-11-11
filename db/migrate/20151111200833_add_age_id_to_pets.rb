class AddAgeIdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :age_id, :integer
  end
end
