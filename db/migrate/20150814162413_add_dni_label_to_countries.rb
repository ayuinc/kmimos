class AddDniLabelToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :dni_label, :string
  end
end
