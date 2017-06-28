class AddUserReferencesToFollowings < ActiveRecord::Migration[5.1]
  def change
    add_reference :followings, :user, foreign_key: true
  end
end
