class AddPostCounterCacheToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :posts_count, :integer, default: 0
  end
end
