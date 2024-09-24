class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all 
    else 
      can :read, Post     
      can :create, Post  
      can :update, Post, user_id: user.id 
      can :destroy, Post, user_id: user.id 

      can :create, Comment  
      can :read , Comment
      can :destroy, Comment, user_id: user.id 

      can :read , SavedPost, user_id: user.id
      can :create ,SavedPost
      can :destroy, SavedPost, user_id: user.id 
    end
  end
end
