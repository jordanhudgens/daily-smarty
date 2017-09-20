require 'rails_helper'

RSpec.describe TopicFollowing, type: :model do
  it 'allows a user to follow a topic and to query the followers' do
    user  = FactoryGirl.create(:user)
    topic = FactoryGirl.create(:topic)

    TopicFollowing.create(topic_id: topic.id, user_id: user.id)

    expect(topic.topic_followings.pluck(:id).include?(user.id)).to eq(true)
  end

  it 'allows a user to follow multiple topics and to query the posts from the topics they are following' do
    user = FactoryGirl.create(:user)

    topic_one = FactoryGirl.create(:topic)
    post_one  = FactoryGirl.create(:post)
    Theme.create(topic: topic_one, post: post_one)

    topic_two = FactoryGirl.create(:topic_two)
    post_two  = FactoryGirl.create(:post_two)
    Theme.create(topic: topic_two, post: post_two)

    TopicFollowing.create(topic_id: topic_one.id, user_id: user.id)
    TopicFollowing.create(topic_id: topic_two.id, user_id: user.id)

    expect(user.topics.pluck(:id)).to eq([topic_one.id, topic_two.id])
  end
end
