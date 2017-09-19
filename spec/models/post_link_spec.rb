require 'rails_helper'

RSpec.describe PostLink, type: :model do
  before do
    @post = FactoryGirl.create(:post)
    @post_link = create(:post_link, post: @post)
  end

  it 'can be created' do
    expect(@post_link).to be_valid
  end

  it 'is associated with a post' do
    expect(@post.post_links.pluck(:id)).to eq([@post_link.id])
  end
end
