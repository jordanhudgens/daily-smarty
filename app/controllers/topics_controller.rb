class TopicsController < ApplicationController
  def index
    @topics = Topic.all.page(params[:page]).per(42)
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @topic_posts = @topic.posts.published
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
