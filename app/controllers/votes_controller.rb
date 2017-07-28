class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_vote

  def upvote
    if Vote.create(user: current_user, post: @post).up!
      @vote.destroy if @vote
      @post.vote_count.increment
    end
    head :ok
  end

  def downvote
    if Vote.create(user: current_user, post: @post).down!
      @vote.destroy if @vote
      @post.vote_count.decrement
    end
    head :ok
  end

  private

    def set_vote
      @vote = Vote.find_by_post_id_and_user_id(@post.id, current_user.id)
    end

    def set_post
      @post = Post.friendly.find(params[:post_slug])
    end
end
