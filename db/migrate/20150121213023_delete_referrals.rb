class DeleteReferrals < ActiveRecord::Migration
  def change
     drop_table :referrals
     create_table :referrals do |t|
      t.string :code_value
      t.string :referrer_name
      t.string :referrer_email

      t.timestamps
    end
  end
end
