class Post < ApplicationRecord
  acts_as_paranoid
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  is_impressionable counter_cache: true
  mount_uploader :img, PostImageUploader
  belongs_to :user
  has_many :themes, inverse_of: :post
  has_many :topics, through: :themes
  has_many :post_links, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one :vote_count, dependent: :destroy

  enum post_status: {
    draft: 0,
    published: 1,
    private_post: 2
  }

  accepts_nested_attributes_for :topics
  accepts_nested_attributes_for :themes, allow_destroy: true

  accepts_nested_attributes_for :post_links,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['link_url'].blank? }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :user_id

  after_create :generate_vote_count

  private def generate_vote_count
    VoteCount.create(post_id: self.id, number_of_votes: 0)
  end
end
