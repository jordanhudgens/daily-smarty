class AddThemessCountToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :themes_count, :integer, default: 0
  end
end
