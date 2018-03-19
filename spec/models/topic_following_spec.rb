require 'rails_helper'

RSpec.describe TopicFollowing, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'allows a user to follow a topic and to query the followers' do
    topic = FactoryBot.create(:topic)

    create(:topic_following, topic: topic, user: @user)

    expect(topic.users.pluck(:id)).to eq([@user.id])
  end

  it 'allows a user to follow multiple topics and to query the posts from the topics they are following' do
    topic_one = FactoryBot.create(:topic)
    post_one  = FactoryBot.create(:post)
    Theme.create(topic: topic_one, post: post_one)

    topic_two = FactoryBot.create(:topic_two)
    post_two  = FactoryBot.create(:post_two)
    Theme.create(topic: topic_two, post: post_two)

    create(:topic_following, topic: topic_one, user: @user)
    create(:topic_following, topic: topic_two, user: @user)

    expect(@user.topics.pluck(:id)).to eq([topic_one.id, topic_two.id])
  end
end
