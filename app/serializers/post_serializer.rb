class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :created_at
  has_many :post_links
end
