class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html{redirect_to root_path, "Success! Please check your inbox for an account confirmation email. Confirm your account to login."}
      else
        format.html{render :create}
      end
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end
