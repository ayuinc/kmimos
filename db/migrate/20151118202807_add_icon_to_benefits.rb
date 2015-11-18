class AddIconToBenefits < ActiveRecord::Migration
  def change
      add_attachment :benefits, :icon
  end
end
