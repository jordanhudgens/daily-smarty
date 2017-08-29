class AddTwitterTokenSecretToSocialConnections < ActiveRecord::Migration[5.1]
  def change
    add_column :social_connections, :twitter_token_secret, :text
  end
end
