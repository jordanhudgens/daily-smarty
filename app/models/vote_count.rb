class VoteCount < ApplicationRecord
  belongs_to :post

  def increment(previously_voted: false)
    self.update!(number_of_votes: self.number_of_votes + number_to_change(previously_voted))
  end

  def decrement(previously_voted: false)
    self.update!(number_of_votes: self.number_of_votes - number_to_change(previously_voted))
  end

  def number_to_change(previously_voted)
    if previously_voted
      2
    else
      1
    end
  end
end
