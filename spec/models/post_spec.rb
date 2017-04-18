require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryGirl.build_stubbed(:post)
  end

  it 'allows a post to be created' do
    expect(@post).to be_valid
  end

  it 'has an owning user' do
    expect(@post.user.full_name).to eq('Jon Snow')
  end
end
