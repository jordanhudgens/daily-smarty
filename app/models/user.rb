class User < ApplicationRecord
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable, :omniauthable, omniauth_providers: [:facebook, :twitter]

  enum role: { standard_user: 0, site_admin: 1 }

  extend FriendlyId
  friendly_id :username, use: :slugged
  has_many :posts, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :social_connections, dependent: :destroy
  has_many :user_images, dependent: :destroy

  accepts_nested_attributes_for :user_images,
                                allow_destroy: true,
                                reject_if: proc { |attrs| attrs[:img].blank? }

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

  has_many :topic_followings
  has_many :topics, through: :topic_followings

  validates_uniqueness_of :username, :slug
  validates_presence_of :full_name, :username, :slug

  after_create :auto_follow_account

  def self.order_by_post_count
    order('posts_count DESC')
  end

  def self.order_by_most_recent_post
    select('users.*,MAX(posts.created_at) as most_recent_post').
      joins(:posts).order('most_recent_post desc').group('users.id')
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.full_name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  private def auto_follow_account
    Following.create(
      follower_id: self.id,
      followed_id: self.id
    )
  end
end
