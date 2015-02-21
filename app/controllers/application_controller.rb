class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :partying

  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id]) if session[:user_id]
  end

  def partying
    if session[:partying]
      partying = true
    else
      partying = false
    end
  end
end
