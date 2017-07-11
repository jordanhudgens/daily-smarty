class StaticController < ApplicationController
  def homepage
    @page_title = 'DailySmarty | A Tool for Learning Something New Everyday'

    if current_user
      @posts = Post.where(user_id: current_user.following_ids)
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
  end
end
