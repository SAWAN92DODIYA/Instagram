class HomeController < ApplicationController
  before_action :authenticate_user! 
  def index
   @posts = Post.where(user_id: [5,6]).order(created_at: :desc)
  end

  def all_user
    @users = User.where.not(id: current_user.id )
  end 
 end
