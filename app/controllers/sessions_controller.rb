class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, :notice => "#{user.username} was successfully logged in!"
    else
      redirect_to login_path, :notice => "Unsuccessful login."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out."
  end

end
