require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build_stubbed(:post)
  end

  it 'allows a post to be created' do
    expect(@post).to be_valid
  end

  it 'has an owning user' do
    expect(@post.user.full_name).to eq('Jon Snow')
  end

  describe 'topic relationship' do
    it 'can have multiple topics through themes' do
      post      = FactoryBot.create(:post)
      topic_one = FactoryBot.create(:topic)
      topic_two = FactoryBot.create(:topic_two)
      Theme.create(topic: topic_one, post: post)
      Theme.create(topic: topic_two, post: post)
      expect(post.topics.pluck(:id)).to eq([topic_one.id, topic_two.id])
    end
  end
end
