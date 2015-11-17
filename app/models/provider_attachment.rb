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
  
  belongs_to :provider
  
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
    
end
