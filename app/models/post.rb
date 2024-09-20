class Post < ApplicationRecord
  has_one_attached :image 
  has_many_attached :pictures
  belongs_to :user
  has_many :comments ,dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :saved_posts
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"
  validates :title,:body, presence: true
  validate :image_or_pictures_present

  
  
  def self.ransackable_attributes(_auth_object = nil)
    %w[user_id title body] 
  end
  
  def self.ransackable_associations(_auth_object = nil)
    [] 
  end

  private

  def image_or_pictures_present
    if image.blank? && pictures.blank?
      errors.add(:base, "Either image or pictures must be attached.")
    end
  end
end
