class AddTokenToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :token, :string
  end
end
