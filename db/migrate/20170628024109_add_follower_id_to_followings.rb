class AddFollowerIdToFollowings < ActiveRecord::Migration[5.1]
  def change
    add_column :followings, :follower_id, :integer
  end
end
