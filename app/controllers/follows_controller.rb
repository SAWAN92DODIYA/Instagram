class FollowsController < ApplicationController
  before_action :authenticate_user!

  def all_followers
    @user = User.find(params[:user_id])
    @followers = @user.followers
  end

  def all_followed
    @user = User.find(params[:user_id])
    @followed_users = @user.followings
  end

  
  def create_followed
 
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to root_path, notice: "Followed!"

  end

 
  def destroy_followed
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    redirect_to root_path, notice: "Unfollowed!"
  end
end
