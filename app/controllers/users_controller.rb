class UsersController < ApplicationController
before_action :find_user, only: [:show]

def index
  @users = User.all
end

def show
  @albums = @user.albums
end

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  if @user.save
    # UserMailer.signup(@user).deliver
    session[:user_id] = @user.id
    redirect_to user_path
  else
      render :new
  end
end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id]) if params[:id]
  end
end
