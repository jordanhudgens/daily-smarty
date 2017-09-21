class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at, :url_for_post
  has_many :post_links
end
