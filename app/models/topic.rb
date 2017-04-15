class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :user_id
end
