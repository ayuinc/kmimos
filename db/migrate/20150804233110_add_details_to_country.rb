class AddDetailsToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :phone, :string
    add_column :countries, :facebook, :string
    add_column :countries, :twitter, :string
    add_column :countries, :flag, :string
    add_column :countries, :domain, :string
  end
end
