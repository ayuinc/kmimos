class RemovePictureUrlFromProviders < ActiveRecord::Migration
  def change
  	remove_column :providers, :picture_url
  end
end
