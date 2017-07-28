class VoteCount < ApplicationRecord
  belongs_to :post

  def increment
    self.update!(number_of_votes: self.number_of_votes + 1)
  end

  def decrement
    self.update!(number_of_votes: self.number_of_votes - 1)
  end
end
