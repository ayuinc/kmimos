class RemoveProvidersFromUsers < ActiveRecord::Migration
  def change
    remove_reference :ages, :provider,index: true, foreign_key: true
  end
end
