class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  is_impressionable counter_cache: true
  mount_uploader :img, PostImageUploader
  belongs_to :user
  has_many :themes, inverse_of: :post
  has_many :topics, through: :themes
  has_many :post_links, dependent: :destroy

  accepts_nested_attributes_for :topics
  accepts_nested_attributes_for :themes, allow_destroy: true

  accepts_nested_attributes_for :post_links,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['link_url'].blank? }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :user_id
end
