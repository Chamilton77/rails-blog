class CommentsController < ApplicationController
  def new
    @com = Comment.new
    @post_id = params[:post_id]
    @user_id = current_user
  end

  def create
    @user=current_user
    @com = @user.comments.new(content: params[:comment][:content], post_id: params[:post_id])
    if @com.save
      redirect_to user_path @user
    else
      puts "THERE WAS AN ERROR"
      redirect_to new_comment_path
    end
  end

  def edit
    @user = current_user
    @com = Comment.find(params[:id])
  end

  def destroy
    @user = current_user
    @com = Comment.find(params[:id])
    @com.destroy
    redirect_to user_path @user 
  end

  def update
    @user = current_user
    @com = Comment.find(params[:id])
    @com.update_attributes(comment_params)
    redirect_to user_path @user
  end

  def show
  end

  private 
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
