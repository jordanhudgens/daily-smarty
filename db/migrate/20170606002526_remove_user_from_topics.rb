class RemoveUserFromTopics < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:topics, :user, index: true, foreign_key: true)
  end
end
