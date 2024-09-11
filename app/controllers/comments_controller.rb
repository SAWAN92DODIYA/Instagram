class CommentsController < ApplicationController
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

  
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
