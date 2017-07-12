class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable

  extend FriendlyId
  friendly_id :username, use: :slugged
  has_many :posts, dependent: :destroy

  has_many :users_are_following_this_user, class_name:  "Following",
                                          foreign_key: "followed_id",
                                          dependent:   :destroy

  has_many :followers, through: :users_are_following_this_user,
                       source: :follower

  has_many :this_user_is_following_other_users, class_name:  "Following",
                                                foreign_key: "follower_id",
                                                dependent:   :destroy

  has_many :following, through: :this_user_is_following_other_users,
                       source: :followed

  validates_uniqueness_of :username, :slug
  validates_presence_of :full_name, :username, :slug

  after_create :auto_follow_account

  private def auto_follow_account
    Following.create(
      follower_id: self.id,
      followed_id: self.id
    )
  end
end
