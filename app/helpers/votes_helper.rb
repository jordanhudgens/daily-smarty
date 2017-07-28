module VotesHelper
  def arrow_color(post, direction)
    if !current_user
      'novote'
    elsif current_user.votes.find_by_post_id(post.id).nil?
      'novote'
    elsif current_user.votes.find_by_post_id(post.id).down? && direction == 'down'
      'downvote'
    elsif current_user.votes.find_by_post_id(post.id).up? && direction == 'up'
      'upvote'
    else
      'novote'
    end
  end
end
