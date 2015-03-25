class ProviderAttachment < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
	belongs_to :provider
end
