class AddUserIdToLocalization < ActiveRecord::Migration
  def change
    add_column :localizations, :user_id, :integer
  end
end
