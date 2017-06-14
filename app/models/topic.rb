class Topic < ApplicationRecord
  has_many :themes, inverse_of: :topic
  has_many :posts, through: :themes

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title

  def self.top_ten
    select('topics.*, COUNT(posts.id) AS posts_count').
      joins(:posts).
      group('topics.id').
      order('posts_count DESC').
      limit(10)
  end
end
