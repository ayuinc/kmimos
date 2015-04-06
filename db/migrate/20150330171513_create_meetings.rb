class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :provider, index: true
      t.string :user_first_name
      t.string :user_last_name
      t.string :user_phone
      t.string :user_email
    end
  end
end
