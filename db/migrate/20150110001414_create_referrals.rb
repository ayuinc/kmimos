class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :code
      t.string :referrer_name
      t.string :referrer_email

      t.timestamps
    end
  end
end