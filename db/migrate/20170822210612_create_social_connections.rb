class CreateSocialConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :social_connections do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.text :uid

      t.timestamps
    end
  end
end
