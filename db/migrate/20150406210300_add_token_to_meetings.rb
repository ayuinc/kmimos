class AddTokenToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :token, :string
  end
end
