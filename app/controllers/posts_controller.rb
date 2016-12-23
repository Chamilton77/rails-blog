class PostsController < ApplicationController
  def new
    #creates a new post instance variable
    @post = Post.new
  end

  def edit
    #this finds a post by its id
    @post = Post.find(params[:id])
  end

  def destroy
    #this takes the information from the post and deletes it 
    @user = current_user
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path @user
  end

  def index
  end

  def update
    #saves the data to the database that comes through the edit part of the controller 
    @user = current_user
    @post = Post.find(params[:id])
    @post.update_attributes(content: params[:post][:content])
    redirect_to user_path @user
  end

  def show
  end

  def create
    # creates a new post from the data from the table in the new section
    @user=current_user
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_path @user
    else
      puts "THERE WAS AN ERROR"
      redirect_to new_post_path
    end
  end

  private 
  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
