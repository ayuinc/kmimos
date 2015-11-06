class AddSymbolToSize < ActiveRecord::Migration
  def change
    add_column :sizes, :symbol, :string
  end
end
