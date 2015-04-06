class AddIframeCodeToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :iframe_code, :text
  end
end
