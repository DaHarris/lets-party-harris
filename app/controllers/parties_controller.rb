class PartiesController < ApplicationController
  before_action :logged_in

  def home
  end

  private

  def logged_in
    if !current_user
      redirect_to login_path
    end
  end

end
