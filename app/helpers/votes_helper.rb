module VotesHelper
  def arrow_color(post, direction)
    if !current_user
      'novote'
    elsif Vote.find_by_post_id(post.id).nil?
      'novote'
    elsif Vote.find_by_post_id(post.id).down? && direction == 'down'
      'downvote'
    elsif Vote.find_by_post_id(post.id).up? && direction == 'up'
      'upvote'
    else
      'novote'
    end
  end
end
