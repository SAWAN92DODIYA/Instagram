class SavedPostsController < ApplicationController
  def index
    @saved_posts = current_user.saved_posts.includes(:post).map(&:post) 
  end

  def show
  end

  def create
    @saved_posts = SavedPost.new(post_id: params[:post_id],user_id: current_user.id)
    @saved_posts.save 
    redirect_to root_path
  end

  def destroy
  end
end
