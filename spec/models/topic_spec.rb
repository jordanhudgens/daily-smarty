require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    @topic = FactoryBot.create(:topic)
  end

  it 'can be created' do
    expect(@topic).to be_valid
  end

  it 'can have multiple posts' do
    post_one = FactoryBot.create(:post)
    post_two = FactoryBot.create(:post_two)
    Theme.create(topic: @topic, post: post_one)
    Theme.create(topic: @topic, post: post_two)
    expect(@topic.posts.count).to eq(2)
  end
end
