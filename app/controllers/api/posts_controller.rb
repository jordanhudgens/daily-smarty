class Api::PostsController < ApplicationController
  protect_from_forgery except: [:create]
  before_action :authenticate, only: [:create]

  def index
    @posts = Post.published.order('created_at DESC').limit(10)
    render json: @posts, adapter: :json
  end

  def search
    if params[:q].blank?
      render json: { errors: 'You need to supply a valid query', status: :unprocessable_entity }
    else
      @posts = Post.search_by_term(params[:q]).page(params[:page]).per(10)
      render json: @posts, adapter: :json
    end
  end

  def create
    @post = Post.new(post_params)
    username = ActionController::HttpAuthentication::Basic::user_name_and_password(request).first
    user = User.find_by_username(username)
    @post.user = user

    if @post.save
      render json: @post, adapter: :json, location: @post
    else
      render json: { errors: @post.errors, status: :unprocessable_entity }
    end
  end

  private

    def post_params
      params.permit(
        :title,
        :content,
        post_links_attributes: [:id, :link_url]
      )
    end

    def authenticate
      authenticate_or_request_with_http_basic do |username, api_key|
        user   = User.find_by_username(username)
        client = ApiClient.find_by_api_key(api_key)
        if (user) && (client) && (user.api_client == client)
          true
        end
      end
    end
end
