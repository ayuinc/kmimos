class AddHasOtherPetsToProvider < ActiveRecord::Migration
  def change
    add_column :providers, :has_other_pets, :boolean
  end
end
