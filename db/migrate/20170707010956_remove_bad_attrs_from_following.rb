class RemoveBadAttrsFromFollowing < ActiveRecord::Migration[5.1]
  def change
    remove_column :followings, :follower, :integer
    remove_column :followings, :following, :integer
  end
end
