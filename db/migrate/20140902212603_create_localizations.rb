class CreateLocalizations < ActiveRecord::Migration
  def change
    create_table :localizations do |t|
      t.references :provider, index: true
      t.references :location, index: true
    end
  end
end
