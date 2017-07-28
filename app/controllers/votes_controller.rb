class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_vote

  def upvote
    @vote.destroy if @vote
    Vote.create!(user: current_user, post: @post).up!
    head :ok
  end

  def downvote
    @vote.destroy if @vote
    Vote.create!(user: current_user, post: @post).down!
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
