class LikesController < ApplicationController
  before_action :authenticate_user!


    def index
      @likes = Post.find(params[:post_id]).likes

    end 

    def create
      post = Post.find(params[:post_id])
      like = current_user.likes.find_or_initialize_by(post: post)
      like.like = !like.like
      like.save

      redirect_to root_path 
      
    end

 
end
