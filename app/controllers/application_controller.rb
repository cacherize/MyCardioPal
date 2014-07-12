class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate
    redirect_to login_path, alert: "Please login first" if current_user.nil?
  end
end
