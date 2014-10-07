class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :last_name_1
      t.string :last_name_2
      t.string :dni
      t.string :email
      t.references :category, index: true

      t.timestamps
    end
  end
end
