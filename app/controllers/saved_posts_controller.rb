class SavedPostsController < ApplicationController
  load_and_authorize_resource 

  def index
    @posts = current_user.saved_posts.includes(:post).map(&:post) 
  end


  def create
    @saved_posts = SavedPost.new(post_id: params[:post_id],user_id: current_user.id)
    @saved_posts.save 
    redirect_to root_path
  end

  def destroy
    if params[:post_id].present?

      @post = SavedPost.find_by(post_id: params[:post_id])
      @post.destroy
    end 
    redirect_to saved_posts_index_path 

  end
end
