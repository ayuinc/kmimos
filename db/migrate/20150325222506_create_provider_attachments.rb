class CreateProviderAttachments < ActiveRecord::Migration
  def change
    create_table :provider_attachments do |t|
      t.integer :provider_id
      t.string :photo

      t.timestamps
    end
  end
end
