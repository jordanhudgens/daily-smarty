class Post < ApplicationRecord
  is_impressionable counter_cache: true
  mount_uploader :img, PostImageUploader
  belongs_to :user
  has_many :themes, inverse_of: :post
  has_many :topics, through: :themes

  accepts_nested_attributes_for :topics
  accepts_nested_attributes_for :themes, allow_destroy: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :content, :user_id
end
