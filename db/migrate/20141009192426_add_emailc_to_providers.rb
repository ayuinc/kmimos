class AddEmailcToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :email_c, :string
  end
end
