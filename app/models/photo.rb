class Photo < ActiveRecord::Base
  #photo belongs to album
	belongs_to	:album
	#validations
	validates 	:album, presence: true
	# Photo uploader using carrierwave
  mount_uploader :image, PhotoUploader
end