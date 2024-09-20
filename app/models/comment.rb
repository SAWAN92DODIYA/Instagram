class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :post
   has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"
   validates :body, presence: true
   
end
