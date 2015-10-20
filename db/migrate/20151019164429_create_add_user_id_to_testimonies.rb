class CreateAddUserIdToTestimonies < ActiveRecord::Migration
  def change
    create_table :add_user_id_to_testimonies do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
