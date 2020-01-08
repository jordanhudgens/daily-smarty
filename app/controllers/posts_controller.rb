class PostsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_post, only: [:post_links, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  impressionist actions: [:show]

  def index
    @posts = Post.published.order('created_at desc').page(params[:page]).per(42)
  end

  def show
    authorize @post
    @page_title = @post.title

    unless @post.content.blank?
      @page_description = truncate(ActionView::Base.full_sanitizer.sanitize(@post.content), length: 300)
    end

    @og_logo = @post.img unless @post.img.blank?
    @og_type = 'article'
    impressionist @post
  end

  def post_links
    @post_links = @post.post_links
    render partial: 'post_links'
  end

  def new
    @post = Post.new
    fb_social = @post.post_social_shares.build(provider: 'facebook')
    twitter_social = @post.post_social_shares.build(provider: 'twitter')

    if fb_social || twitter_social
      @social_share_options = [fb_social, twitter_social]
    else
      @social_share_options = []
    end
  end

  def edit
    authorize @post
    @social_share_options = @post.post_social_shares
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.slug), notice: 'Post was successfully deleted.' }
    end
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :title,
        :content,
        :user_id,
        :img,
        :post_status,
        post_social_shares_attributes: [:id, :provider, :status],
        topic_titles: [],
        post_links_attributes: [:id, :post_id, :_destroy, :link_url]
      )
    end
end
