class UsersController < ApplicationController

  def login
    @user = User.new
  end

  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to root_path, :notice => 'User was successfully created.'
  end

end
