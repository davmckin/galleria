class SessionController < ApplicationController

  def new
  end

def create
  @user = User.find_by(username: params[:session][:username])
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    flash[:primary] = "Welcome #{@user.username}!"
    redirect_to :root
  else
    flash[:danger] = "Invalid username or password. Please try Again."
    redirect_to :login
  end
end

def destroy
  session[:user_id] = nil
  redirect_to :root
end
end
