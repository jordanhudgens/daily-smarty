class Vote < ApplicationRecord
  belongs_to :post
  belongs_to :user

  enum choice: { up: 0, down: 1 }

  validates_uniqueness_of :choice, scope: [:post_id, :user_id], if: :duplicate_vote?

  private def duplicate_vote?
    return false if Vote.find_by_post_id_and_user_id(self.post, self.user).nil?
    return true if Vote.find_by_post_id_and_user_id(self.post, self.user).choice == self.choice
  end
end
