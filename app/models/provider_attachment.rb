# == Schema Information
#
# Table name: provider_attachments
#
#  id          :integer          not null, primary key
#  provider_id :integer
#  photo       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class ProviderAttachment < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
	belongs_to :provider
end
