require 'rails_helper'

RSpec.describe Following, type: :model do
  it 'allows a user to follow another user and to query the followers' do
    user_one = FactoryBot.create(:user)
    user_two = FactoryBot.create(:user)

    Following.create!(follower_id: user_one.id, followed_id: user_two.id)

    expect(user_two.followers.pluck(:id).include?(user_one.id)).to eq(true)
  end

  it 'allows a user to follow another user and to query the list of users they are following' do
    user_one = FactoryBot.create(:user)
    user_two = FactoryBot.create(:user)

    Following.create!(follower_id: user_one.id, followed_id: user_two.id)

    expect(user_one.following.pluck(:id).include?(user_two.id)).to eq(true)
  end
end
