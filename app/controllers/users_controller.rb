class UsersController < ApplicationController
  def new

  end

  def edit
    @user = current_user
  end

  def destroy
    current_user.destroy
    redirect_to login_path
  end

  def index
    @user = User.new
  end

  def update
    puts "THIS IS THE USER #{@user}"
    @user = current_user
    @user.update_attributes(user_params)
    redirect_to user_path
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      redirect_to new_user_path
    end
  end

  private 
  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
end
