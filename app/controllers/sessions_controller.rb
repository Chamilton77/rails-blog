class SessionsController < ApplicationController
  def new
  	session[:user_id] = nil
  	@user = current_user
  	puts "THIS IS THE CURRENT USER #{@user}"
  end

  def create
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
  	current_user.destroy
  	redirect_to login_path
  end
end
