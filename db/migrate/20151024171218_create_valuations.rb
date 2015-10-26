class CreateValuations < ActiveRecord::Migration
  def change
    create_table :valuations do |t|
      t.string :name

      t.timestamps
    end
  end
end
