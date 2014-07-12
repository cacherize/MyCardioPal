class SessionsController < ApplicationController
  skip_filter :authenticate
  def new
  end

  def create
    user = User.find_by_email_or_username(params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Success! Logged in!"
    else
      flash.now.alert = "Invalid Username/Email or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
