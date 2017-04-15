class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :content, :topic_id, :user_id
end
