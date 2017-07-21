class PostLink < ApplicationRecord
  belongs_to :post
  validates_presence_of :link_url, :post_id
  validates :link_url, url: true
end
