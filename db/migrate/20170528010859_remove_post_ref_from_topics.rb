class RemovePostRefFromTopics < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:topics, :post, index: true)
  end
end
