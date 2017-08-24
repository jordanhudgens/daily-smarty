class AddStatusToPostSocialShares < ActiveRecord::Migration[5.1]
  def change
    add_column :post_social_shares, :status, :integer, default: 0
  end
end
