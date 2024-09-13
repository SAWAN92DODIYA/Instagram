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

  def search_user
    if params[:title].present?
      @users = User.where("profile_name Like ?", "%#{params[:title]}%")
     else
        flash[:errors] = "We Couldn't find your request."
    end 
  end 

 
end 