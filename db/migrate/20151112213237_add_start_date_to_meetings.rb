class AddStartDateToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :start_date, :date
  end
end
