class CreatePromotionalCodes < ActiveRecord::Migration
  def change
    create_table :promotional_codes do |t|
      t.string :code
      t.datetime :expire_at
      t.string :state

      t.timestamps
    end
  end
end
