class UsersController < ApplicationController
  skip_filter :authenticate, only: [:new, :create]
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
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
end
