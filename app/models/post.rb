class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  extend FriendlyId
  friendly_id :title, use: :slugged
end
