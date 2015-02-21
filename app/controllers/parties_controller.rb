class PartiesController < ApplicationController
  before_action :logged_in

  def home
  end

  def options
  end

  def party
    session[:partying] = true
    redirect_to home_path, notice: "Let's Party!"
  end

  def stop
    session[:partying] = false
    redirect_to home_path, notice: "Stopped Partying"
  end

  private

  def logged_in
    if !current_user
      redirect_to login_path
    end
  end

end
