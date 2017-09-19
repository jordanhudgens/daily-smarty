class Api::PostsController < ApplicationController
  protect_from_forgery except: [:create]

  def index
    @posts = Post.published.order('created_at DESC').limit(10)
    render json: @posts, adapter: :json
  end

  def search

  end

  def create
    # TODO
    # Allow for post title, content and post links to create posts
    # And add auth
  end
end
