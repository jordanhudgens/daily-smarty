class SwapTopicPostOwnership < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:posts, :topic, index: true)
    add_reference(:topics, :post, index: true)
  end
end
