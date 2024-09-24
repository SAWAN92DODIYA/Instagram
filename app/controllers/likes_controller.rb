class LikesController < ApplicationController
  before_action :authenticate_user!
    def index
      @likes = Post.find(params[:post_id]).likes.where(like: true)
    end

    def create
      post = Post.find(params[:post_id])
      like = current_user.likes.find_or_initialize_by(post: post)
      like.like = !like.like

      if like.save
        redirect_to request.referer
      else
        redirect_to root_path, alert: "There was an error."
      end
    end
end
