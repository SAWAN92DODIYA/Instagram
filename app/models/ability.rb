class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all 
    else 
      can :read, Post     # Regular users can read all posts
      can :create, Post   # Can create posts
      can :update, Post, user_id: user.id  # Can edit their own posts
      can :destroy, Post, user_id: user.id # Can delete their own posts

      can :create, Comment    # Can comment
      can :destroy, Comment, user_id: user.id 
    end
  end
end
