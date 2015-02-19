class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "#{user.username} was successfully logged in!"
    else
      redirect_to login_path, :notice => "Unsuccessfuly login."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out."
  end

end
