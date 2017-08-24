class PostSocialShare < ApplicationRecord
  belongs_to :post, inverse_of: :post_social_shares
  validates_presence_of :provider, :post_id
end
