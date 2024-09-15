class PostsController < ApplicationController
  before_action :set_post , only: %i[show edit update destroy]

  def index
    
  end

  def show
    
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user.id)
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to @post
    # else
    #   render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end

  def update
  end

  def destroy
    
   if @post.destroy!
    redirect_to home_my_profile_path
   end
  end

  private 

  def set_post 
    @post = Post.find(params[:id])
  end 

  def post_params 
    params.require(:post).permit(:title, :body,:image, pictures: [])
  end
end
