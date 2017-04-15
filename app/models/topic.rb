class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts

  extend FriendlyId
  friendly_id :title, use: :slugged
end
