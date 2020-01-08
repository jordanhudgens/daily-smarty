class TopicsController < ApplicationController
  def index
    @topics = Topic
               .order_by_post_count
               .page(params[:page])
               .per(10)
  end

  def show
    @topic = Topic.friendly.find(params[:id])

    if current_user && current_user.site_admin?
      @topic_posts = @topic.posts
    else
      @topic_posts = @topic.posts.published
    end
  end

  def topic_follow_toggle
    authenticate_user!

    if TopicFollowing.where(user_id: current_user.id, topic_id: params[:id]).any?
      TopicFollowing.find_by_user_id_and_topic_id(current_user.id, params[:id]).destroy
      head :ok
    else
      TopicFollowing.create!(user_id: current_user.id, topic_id: params[:id])
      head :ok
    end
  end

  def autocomplete
    topics = Topic.where('title ILIKE ?', "%#{params[:q]}%")
    render json:
    {
        results: topics.map {|t| {text: t.title, id: t.id}}
    }
  end
end
