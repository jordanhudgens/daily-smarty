class AddDeletedAtToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :deleted_at, :datetime
    add_index :topics, :deleted_at
  end
end
