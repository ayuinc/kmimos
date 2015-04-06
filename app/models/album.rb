class Album < ActiveRecord::Base
	# belongs to user model
	belongs_to	:provider
	# Album has many photos
	has_many    :photos, :inverse_of => :album, :dependent => :destroy
	# enable nested attributes for photos through album class
	accepts_nested_attributes_for :photos, allow_destroy: true
end