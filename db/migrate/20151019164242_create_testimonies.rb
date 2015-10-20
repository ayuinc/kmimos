class CreateTestimonies < ActiveRecord::Migration
  def change
    create_table :testimonies do |t|
      t.text :body
      t.string :name

      t.timestamps
    end
  end
end
