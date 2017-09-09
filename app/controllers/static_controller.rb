class StaticController < ApplicationController
  def homepage
    @page_title = 'DailySmarty | A Tool for Learning Something New Everyday'

    if current_user
      post_ids = []

      if current_user.following_ids.any?
        post_ids << Post.where(user_id: current_user.following_ids)
                      .published
                      .order('created_at desc')
                      .limit(10)
                      .pluck(:id)
      end

      if current_user.topics.any?
        post_ids_from_followed_topics = current_user.topics.map do |topic|
          topic.posts.published.order('created_at desc').map do |post|
            post_ids << post.id
          end
        end
      end

      @posts = Post.where(id: post_ids.flatten).order('created_at desc').page(params[:page]).per(20)

      render 'static/feed'
    else
      @topics = Topic.top_ten
    end
  end

  def profile
    @user = User.friendly.find(params[:id])

    if @user == current_user
      @posts = @user.posts.page(params[:page]).per(20)
    else
      @posts = @user.posts.published.page(params[:page]).per(20)
    end
  end

  def privacy_policy
  end

  def terms_conditions
  end

  def popular
    @posts = Post.where.not(impressions_count: nil)
               .published
               .where(created_at: (Date.today - 7.days)..Date.today)
               .order('impressions_count DESC')
               .page(params[:page])
               .per(42)
  end
end
