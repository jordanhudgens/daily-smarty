class Api::PostsController < ApplicationController
  protect_from_forgery except: [:create]
  before_action :authenticate

  def index
    @posts = Post.published.order('created_at DESC').limit(10)
    render json: @posts, adapter: :json
  end

  def search

  end

  def create
    @post = Post.new(post_params)

    username = ActionController::HttpAuthentication::Basic::user_name_and_password(request).first

    user = User.find_by_username(username)

    @post.user = user

    # TODO Find out how to accept link urls
    if @post.save
      render json { render @post, status: :created, location: @post }
    else
      render json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  private

    def post_params
      params.require(:post).permit(
        :title,
        :content,
        post_links: [:id, :post_id, :link_url]
      )
    end

    def authenticate
      authenticate_or_request_with_http_basic do |source_app, api_key|
        client = ApiClient.find_by_source_app(source_app)
        client && client.api_key == api_key
      end
    end
end
