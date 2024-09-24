class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    user_ids = current_user.followings.pluck(:id) + current_user.followers.pluck(:id)
    user_ids << current_user.id
    @posts = Post.where(user_id: user_ids.uniq).includes(:user).order(created_at: :desc)

  end

  def user_profile 
    @days_since_created = (Date.today - current_user.created_at.to_date).to_i
    @posts = current_user.posts.all.order(created_at: :desc)

  end

  def search_user
    if params[:title].present?
      @users = User.where("profile_name Like ?", "%#{params[:title]}%")
      @posts = Post.where("body Like ?", "%#{params[:title]}%")
     else
        flash[:errors] = "We Couldn't find your request."
    end 
  end 
end 