class PostLink < ApplicationRecord
  belongs_to :post
  validates_presence_of :link_url
  validates :link_url, url: true
end
