class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @user = current_user
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path @user
  end

  def index
  end

  def update
    @user = current_user
    @post = Post.find(params[:id])
    @post.update_attributes(content: params[:post][:content])
    redirect_to user_path @user
  end

  def show
  end

  def create
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
