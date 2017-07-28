class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @topic_posts = @topic.posts.published
  end

  def autocomplete
    topics = Topic.where('title ILIKE ?', "%#{params[:q]}%")
    render json:
    {
        results: topics.map {|t| {text: t.title, id: t.id}}
    }
  end
end
