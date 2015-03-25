class AlbumsController < ApplicationController
# truncated for brevity.
  
  def new
    @album = Booking.new
  end
  def create
    @album = current_user.albums.build(album_params)
    authorize @album
    if @album.save
      # to handle multiple images upload on create
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
      end
      flash[:notice] = "Your album has been created."
      redirect_to @album
    else 
      flash[:alert] = "Something went wrong."
      render :new
    end
  end
  def update
    authorize @album
    if @album.update(params[:album].permit(:title,:description))
      # to handle multiple images upload on update when user add more picture
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
      end
      flash[:notice] = "Album has been updated."
      redirect_to @album
    else
      render :edit
    end
  end
end