class Post < ApplicationRecord
  has_one_attached :image 
  has_many_attached :pictures
  # has_rich_text :body
  belongs_to :user
  has_many :comments ,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :saved_posts
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"

end
