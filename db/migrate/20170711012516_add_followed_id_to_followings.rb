class AddFollowedIdToFollowings < ActiveRecord::Migration[5.1]
  def change
    add_column :followings, :followed_id, :integer
    remove_column :followings, :user_id, :bigint
  end
end
