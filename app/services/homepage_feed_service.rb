class HomepageFeedService
  def initialize(user:)
    @user = user
  end

  def post_ids
    ids = []

    if @user.following_ids.any?
      ids << Post.where(user_id: @user.following_ids)
                   .published
                   .order('created_at desc')
                   .limit(10)
                   .pluck(:id)
    end

    if @user.topics.any?
      @user.topics.map do |topic|
        topic.posts.published.order('created_at desc').map do |post|
          ids << post.id
        end
      end
    end

    ids.flatten
  end
end
