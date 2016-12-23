class CommentsController < ApplicationController
  def new
    #this block is used to make a new comment that has both the post id and the user id
    @com = Comment.new
    @post_id = params[:post_id]
    @user_id = current_user
  end

  def create
    #this takes the info from the new form and saves it after checking the params then redirects to the user home page
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
    #this makes it so that you can edit the information that is attached to the comment
    @user = current_user
    @com = Comment.find(params[:id])
  end

  def destroy
    #this finds the current comment and destroys it
    @user = current_user
    @com = Comment.find(params[:id])
    @com.destroy
    redirect_to user_path @user 
  end

  def update
    #update comes after edit and saves what was changed
    @user = current_user
    @com = Comment.find(params[:id])
    @com.update_attributes(comment_params)
    redirect_to user_path @user
  end

  def show
  end

  private 
  def comment_params
    # this makes the secure params 
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
