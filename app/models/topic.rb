class Topic < ApplicationRecord
  has_many :themes, inverse_of: :topic
  has_many :posts, through: :themes

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
end
