class AlbumsController < ApplicationController

before_action :require_user, only: [:new, :create]
before_action :redirect_if_logged_out, only: [:index]

def redirect_if_logged_out
  redirect_to about_path if current_user.blank?
end

def about

end

def index
  @albums = Album.page(params[:page])
end

def show
  @album = Album.find(params[:id]).photos.all
end

def new
  @album = Album.new
end

def create
  @album = current_user.album.new(album_params)
  if @album.save
    redirect_to @album
  else
    render :new
  end
end

  private

  def album_params
    params.require(:album).permit(:title)
  end

end
