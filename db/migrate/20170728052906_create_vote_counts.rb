class CreateVoteCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :vote_counts do |t|
      t.references :post, foreign_key: true
      t.integer :number_of_votes

      t.timestamps
    end
  end
end
