require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'allows a post to be created' do
    post = FactoryGirl.create(:post)
    expect(post).to be_valid
  end
end
