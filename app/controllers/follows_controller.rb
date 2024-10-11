class FollowsController < ApplicationController
  before_action :follow_params, only: %i[all_followers all_followed create_followed destroy_followed]
  before_action :authenticate_user!

  def all_followers
    @followers = @user.followers
  end

  def all_followed
    @followed_users = @user.followings
  end

  def create_followed
    current_user.follow(@user)
    redirect_to root_path 
  end

  def destroy_followed
    current_user.unfollow(@user)
    redirect_to root_path, notice: "Unfollowed!"
  end

  private

  def follow_params
    @user = User.find(params[:user_id])
  end
end
