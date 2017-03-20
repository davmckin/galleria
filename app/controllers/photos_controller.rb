class PhotosController < ApplicationController
  def show; end

  def new
    @album = Album.find(params[:album_id])
    @photo = Photo.new
  end

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.user.photos.new(photo_params)
    if @photo.save
      @album.photos << @photo
      redirect_to @album
    else
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :url)
  end
end
