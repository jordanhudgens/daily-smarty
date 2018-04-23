class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :url_for_post, :associated_topics
  has_many :post_links
end
