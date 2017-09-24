class HomepageFeedService
  def initialize(user:)
    @user = user
    @ids = []
  end

  def post_ids_from_followed_users
    if @user.following_ids.any?
      @ids << Post.where(user_id: @user.following_ids)
                   .published
                   .order('created_at desc')
                   .limit(10)
                   .pluck(:id)
    end
  end

  def post_ids_from_followed_topics
    if @user.topics.any?
      @user.topics.map do |topic|
        topic.posts.published.order('created_at desc').map do |post|
          @ids << post.id
        end
      end
    end
  end

  def post_ids
    post_ids_from_followed_users
    post_ids_from_followed_topics
    @ids.flatten
  end

  def feed_query
    Post.where(id: post_ids).order('created_at desc')
  end
end
