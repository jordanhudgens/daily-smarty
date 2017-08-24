class CreatePostSocialShares < ActiveRecord::Migration[5.1]
  def change
    create_table :post_social_shares do |t|
      t.references :post, foreign_key: true
      t.string :provider

      t.timestamps
    end
  end
end
