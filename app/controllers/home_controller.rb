class HomeController < ApplicationController
  before_action :authenticate_user!
  # authorize_resource only: [:all_user]
  # load_and_authorize_resource
  # load_and_authorize_resource only: [:all_user] 

  def index
   @posts = Post.order(created_at: :desc)
  end

  def all_user
    authorize! :all_user, User
    @users = User.where.not(id: current_user.id )
    
  end  
 end
