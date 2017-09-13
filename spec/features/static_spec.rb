require 'rails_helper'

describe 'Static Pages' do
  it 'has a homepage with a specific title' do
    visit root_path
    expect(page.title).to eq('DailySmarty | A Tool for Learning Something New Everyday')
  end

  describe 'logged in behavior' do
    before do
      @user_one      = FactoryGirl.create(:user)
      @user_two      = FactoryGirl.create(:user)
      @user_two_post = create(:published_post, user: @user_two)
      login_as(@user_one)
    end

    it 'shows a feed page when a user is logged in' do
      visit root_path
      expect(page).to have_content('My Feed')
    end

    it 'shows posts from followed users' do
      Following.create!(follower_id: @user_one.id, followed_id: @user_two.id)
      visit root_path
      expect(page).to have_content(@user_two.username)
    end

    it 'does not show posts from users that are not followed' do
      visit root_path
      expect(page).to_not have_content(@user_two.username)
    end

    it 'shows posts from followed topics' do
      topic = FactoryGirl.create(:topic)
      Theme.create(topic: topic, post: @user_two_post)
      create(:topic_following, user: @user_one, topic: topic)
      visit root_path
      expect(page).to have_content(@user_two.username)
    end
  end
end
