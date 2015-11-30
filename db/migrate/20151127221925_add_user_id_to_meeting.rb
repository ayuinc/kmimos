class AddUserIdToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :user_id, :integer
  end
end
