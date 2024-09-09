class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
   @posts = Post.order(created_at: :desc)
  end

  def all_user
    authorize! :all_user, User
    @users = User.where.not(id: current_user.id )
    
  end 
  
  def user_profile 
    @user = User.find(current_user.id)
    @posts = @user.posts.all
  end

 
end 