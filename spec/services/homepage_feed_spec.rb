require 'rails_helper'

describe HomepageFeedService do
  it 'creates a merged feed between followed topics and users' do
    user       = FactoryGirl.create(:user)
    user_two   = FactoryGirl.create(:user)
    user_three = FactoryGirl.create(:user)
    topic      = FactoryGirl.create(:topic)
    post_one   = FactoryGirl.create(:published_post, user: user_two)
    post_two   = FactoryGirl.create(:published_post, user: user_three)

    TopicFollowing.create(topic:  topic,   user: user)
    Theme.create(topic:           topic,   post: post_one)
    Following.create(follower_id: user.id, followed_id: user_three.id)

    hfs = HomepageFeedService.new(user: user)
    posts = hfs.feed_query

    expect(posts.count).to eq(2)
  end
end
