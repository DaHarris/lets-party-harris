class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params)
    if @user.save
      redirect_to login_path, :notice => 'User was successfully created.'
    else
      redirect_to new_user_path, :notice => 'User was unsuccessfully created, try again.'
    end
  end


  private

  def user_create_params
    params.require(:user).permit(:username, :email, :password)
  end

end
