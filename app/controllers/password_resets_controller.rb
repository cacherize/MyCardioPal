class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email_or_username(params[:login])
    user.send_password_reset if user
    redirect_to login_path, notice: 'Check your inbox for an email with password reset instructions.'
  end

  def edit
    @user.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, alert: "Your request to reset your password has expired please try again."
    elsif @user.update_attributes(params[:user])
      redirect_to login_path, notice: "Success! Password has been reset!"
    else
      render :edit
    end
  end
end
