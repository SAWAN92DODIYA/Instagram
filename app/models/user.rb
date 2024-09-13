class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_pic 
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :saved_posts,dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy, class_name: "Noticed::Notification"
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"


  has_many :active_relationships, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy,
  inverse_of: :follower
  has_many :followings, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy,
   inverse_of: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  



  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id)&.destroy
  end

  def following?(user)
   
    followings.include?(user)
  end

end



