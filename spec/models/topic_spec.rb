require 'rails_helper'

RSpec.describe Topic, type: :model do
  it 'can be created' do
    topic = FactoryGirl.create(:topic)
    expect(topic).to be_valid
  end

  it 'can have multiple posts' do
    topic = FactoryGirl.create(:topic)
    post_one = FactoryGirl.create(:post)
    post_two = FactoryGirl.create(:post_two)
    Theme.create(topic: topic, post: post_one)
    Theme.create(topic: topic, post: post_two)
    expect(topic.posts.count).to eq(2)
  end
end
