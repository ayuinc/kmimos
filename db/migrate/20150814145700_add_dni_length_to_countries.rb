class AddDniLengthToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :dni_length, :integer
  end
end
