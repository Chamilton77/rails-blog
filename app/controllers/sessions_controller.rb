class SessionsController < ApplicationController
  def new
    #this checks to see if there is a user signed in and if there is a session it sets it to nil
    # Then it makes a new session for the current user
  	session[:user_id] = nil
  	@user = current_user
  	puts "THIS IS THE CURRENT USER #{@user}"
  end

  def create
    #this gives the user a new session and redirects them to their main page 
  	puts "This is the current user #{current_user}"
  	puts "THESE ARE MY PARAMS #{params.inspect}"
  	@user = User.where(email: params[:email], password: params[:password]).first
  	puts "DID WE GET A USER? #{@user}"
  	if @user
  		session[:user_id] = @user.id
  		redirect_to user_path @user
  	else
  		redirect_to login_path
  	end
  end

  def destroy
    #logs out the current user
  	current_user.destroy
  	redirect_to login_path
  end
end
