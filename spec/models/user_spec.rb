require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  it 'can create a user factory' do
    expect(@user).to be_valid
  end

  it 'has the ability to have many posts' do
    post_one = create(:post, user: @user)
    post_two = create(:post, user: @user)
    expect(@user.posts.pluck(:id)).to eq([post_one.id, post_two.id])
  end
end
