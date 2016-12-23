class UserfriendsController < ApplicationController
  def index

  end

  def new
  end

  def create
    #This takes the current user and adds another user on to their friends page with the friend id
    @user = current_user
    @userfriend = current_user.userfriends.new(friend_id: params[:friend_id])
    @userfriend.save
    redirect_to user_path @user
  end

  def edit
  end

  def destroy
    #this deletes the friend from the Users account
    @user = current_user
    @friend = Userfriend.find(params[:id])
    @friend.destroy
    redirect_to user_path @user
  end

  def show
    #shows all of the friends that the user has
    @friends = current_user.userfriends
  end

  def update
  end

  private 
  def userfriend_params
    params.require(:userfriends).permit(:fname, :user_id, :friend_id)
  end
end
