class PhotosController < ApplicationController
  before_action :require_user, only: [:new, :create, :destroy]
  before_action :is_owner, only: [:destroy]

  def show
  end

  def new
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

  def is_owner
   @photo = current_user.photo.find_by(id: params[:id])
   unless @photo && @photo.user == current_user
     flash[:danger] = "You can't do that."
     redirect_to :root
   end
  end


end
