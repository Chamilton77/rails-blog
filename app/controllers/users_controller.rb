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
    @user.update_attributes(fname: params[:user][:fname], lname: params[:user][:lname], email: params[:user][:email], password: params[:user][:password])
    redirect_to user_path
  end

  def show
    puts params.inspect
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account was created successfully!"
      redirect_to login_path
    else
      flash[:alert] = "There was a problem saving your account."
      redirect_to new_user_path
    end
  end
end
