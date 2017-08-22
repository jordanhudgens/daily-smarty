class StaticController < ApplicationController
  def homepage
    @page_title = 'DailySmarty | A Tool for Learning Something New Everyday'

    if current_user
      @posts = Post.where(user_id: current_user.following_ids)
                 .published
                 .order('created_at desc')
                 .page(params[:page])
                 .per(42)

      render 'static/feed'
    else
      @topics = Topic.top_ten
    end
  end

  def profile
    @user = User.friendly.find(params[:id])

    if @user == current_user
      @posts = @user.posts
    else
      @posts = @user.posts.published
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
