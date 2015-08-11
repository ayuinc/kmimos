class RemoveProvidersFromSize < ActiveRecord::Migration
  def change
    remove_reference :sizes, :provider,index: true, foreign_key: true
  end
end
