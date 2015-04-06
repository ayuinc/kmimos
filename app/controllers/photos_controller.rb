class PhotosController < ApplicationController
# truncated for brevity.
  def create
    @photo = Photo.new(photo_params)
    @photo.save
  end
end