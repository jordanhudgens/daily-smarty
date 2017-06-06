class AddJoinTableBetweenPostsAndTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
      t.belongs_to :topic, index: true
      t.belongs_to :post, index: true
      t.timestamps
    end
  end
end
