class UsersController < ApplicationController
  def new
    #makes a new instance variable for User
    @user = User.new
  end

  def edit
    #gets the current user and makes it so you can edit the info for the user
    @user = current_user
  end

  def destroy
    #gets the current user and deletes their account info
    current_user.destroy
    redirect_to login_path
  end

  def index
    #makes an instance of all the users
    @users = User.all
  end

  def update
    #takes the info from the edit page and adds it to the database
    puts "THIS IS THE USER #{@user}"
    @user = current_user
    @user.update_attributes(user_params)
    redirect_to user_path
  end

  def show
    #finds a user by its id and then shows the page of that user
    @user = User.find(params[:id])
  end

  def create
    #creates a new user from a form and saves it to the database
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render "new"
    end
  end

  private 
  def user_params
    params.require(:user).permit(:fname, :lname, :email, :password)
  end
end
