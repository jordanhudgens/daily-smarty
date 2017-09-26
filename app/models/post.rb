class Post < ApplicationRecord
  acts_as_paranoid
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  is_impressionable counter_cache: true
  mount_uploader :img, ImageUploader
  belongs_to :user, counter_cache: true
  has_many :themes, inverse_of: :post, autosave: true
  has_many :topics, through: :themes, autosave: true
  has_many :post_links, inverse_of: :post, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :post_social_shares, inverse_of: :post
  has_one :vote_count, dependent: :destroy

  enum post_status: {
    draft: 0,
    published: 1,
    private_post: 2
  }

  accepts_nested_attributes_for :post_social_shares,
                                allow_destroy: true,
                                reject_if: proc { |attrs| attrs[:provider].blank? }
  accepts_nested_attributes_for :topics
  accepts_nested_attributes_for :themes, allow_destroy: true
  accepts_nested_attributes_for :post_links,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['link_url'].blank? }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :user_id

  after_create :generate_vote_count

  def topic_titles=(titles)
    transaction do
      themes.delete_all
      titles.each do |title|
        unless title.blank?
          topic = Topic.find_or_create_by!(title: title)
          self.themes.build(topic: topic)
        end
      end
    end
  end

  def topic_titles
    topics.map(&:title)
  end

  def url_for_post
    "http://www.dailysmarty.com/posts/#{self.slug}"
  end

  private def generate_vote_count
    VoteCount.create(post_id: self.id, number_of_votes: 0)
  end
end
