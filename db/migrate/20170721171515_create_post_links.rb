class CreatePostLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :post_links do |t|
      t.references :post, foreign_key: true
      t.text :link_url

      t.timestamps
    end
  end
end
