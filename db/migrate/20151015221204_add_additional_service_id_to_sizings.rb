class AddAdditionalServiceIdToSizings < ActiveRecord::Migration
  def change
    add_column :sizings, :additional_service_id, :integer
  end
end
