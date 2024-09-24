class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource 
  def index
    @comments = Post.find(params[:post_id]).comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

  if @comment.save
      redirect_to root_path, notice: 'Comment was successfully created.'
    else
      redirect_to root_path, alert: 'There was an error saving your comment.'
    end
  end

  
  def destroy
    authorize! :destroy, @comment 
    comment = Comment.find(params[:id])
    if comment.destroy!
      redirect_to post_comments_path(params[:post_id])
    end 
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
