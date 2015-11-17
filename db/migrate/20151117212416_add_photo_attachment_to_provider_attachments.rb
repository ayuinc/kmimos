class AddPhotoAttachmentToProviderAttachments < ActiveRecord::Migration
  def change 
    add_attachment :provider_attachments, :photo
  end
end
