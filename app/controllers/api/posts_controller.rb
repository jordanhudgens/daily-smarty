class Api::PostsController < ApplicationController
  def index
    @posts = Post.published.order('created_at DESC').limit(10)
    render json: @posts, adapter: :json
  end

  def search

  end

  def create

  end
end
