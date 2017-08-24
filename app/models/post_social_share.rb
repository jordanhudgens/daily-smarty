class PostSocialShare < ApplicationRecord
  enum status: { not_to_export: 0, export_post: 1 }
  belongs_to :post, inverse_of: :post_social_shares
  validates_presence_of :provider
end
