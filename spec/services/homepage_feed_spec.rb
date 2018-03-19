require 'rails_helper'

describe HomepageFeedService do
  it 'creates a merged feed between followed topics and users' do
    user       = FactoryBot.create(:user)
    user_two   = FactoryBot.create(:user)
    user_three = FactoryBot.create(:user)
    topic      = FactoryBot.create(:topic)
    post_one   = FactoryBot.create(:published_post, user: user_two)
    post_two   = FactoryBot.create(:published_post, user: user_three)

    TopicFollowing.create(topic:  topic,   user: user)
    Theme.create(topic:           topic,   post: post_one)
    Following.create(follower_id: user.id, followed_id: user_three.id)

    hfs = HomepageFeedService.new(user: user)
    posts = hfs.feed_query

    expect(posts.count).to eq(2)
  end
end
