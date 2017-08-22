class AddTokenToSocialConnections < ActiveRecord::Migration[5.1]
  def change
    add_column :social_connections, :token, :text
  end
end
