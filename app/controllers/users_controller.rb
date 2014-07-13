class UsersController < ApplicationController
  skip_filter :authenticate, only: [:new, :create, :confirm]
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.invitation_sent_at = DateTime.now
    respond_to do |format|
      if @user.save
        Messager.invitation(@user).deliver
        format.html{redirect_to root_path, notice: "Success! Please check your inbox for an account confirmation email. Confirm your account to login."}
      else
        format.html{render :new}
      end
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = current_user
  end

  def destroy
  end

  def confirm
    @user = User.find_by_auth_token!(params[:id])
    @user.update_column(:activated, true)
    respond_to do |format|
      format.html{redirect_to(login_path, notice: 'Your account has been activated! You can now login!')}
    end
  end
end
