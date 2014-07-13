class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :store_location
  before_filter :authenticate

  private

  def store_location
    session["return_path"] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session["return_path"] || default)
    session["return_path"] = nil
  end

  def current_user
    @current_user ||= User.find_by_auth_token(session[:auth_token]) if session[:auth_token]
  end
  helper_method :current_user

  def authenticate
    redirect_to login_path, alert: "Please login first" if current_user.nil?
  end
end
