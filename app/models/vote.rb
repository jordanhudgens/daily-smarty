class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :user

  enum choice: { up: 0, down: 1 }

  validates_uniqueness_of :user_id, scope: :post_id
end
