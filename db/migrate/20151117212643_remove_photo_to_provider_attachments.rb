class RemovePhotoToProviderAttachments < ActiveRecord::Migration
  def change
    remove_column :provider_attachments, :photo, :string
  end
end
