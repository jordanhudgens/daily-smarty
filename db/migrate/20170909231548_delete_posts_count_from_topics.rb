class DeletePostsCountFromTopics < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics, :posts_count, :integer
  end
end
