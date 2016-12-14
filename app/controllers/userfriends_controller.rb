class UserfriendsController < ApplicationController
  def index

  end

  def new
  end

  def create
    @user = current_user
    @userfriend = current_user.userfriends.new(friend_id: params[:friend_id])
    @userfriend.save
    redirect_to user_path @user
  end

  def edit
  end

  def destroy
    @user = current_user
    @friend = Userfriend.find(params[:id])
    @friend.destroy
    redirect_to user_path @user
  end

  def show
    @friends = current_user.userfriends
  end

  def update
  end

  private 
  def userfriend_params
    params.require(:userfriends).permit(:fname, :user_id, :friend_id)
  end
end
