require 'rails_helper'

describe 'Post feature' do
  it 'can be visited by the post creator' do
    post = FactoryGirl.create(:post)
    login_as(post.user, :scope => :user)
    visit post_path(post)
    expect(page).to have_content(post.title)
  end

  it 'can be visited by a site visitor' do
    visit root_path
    expect(page.title).to eq('DailySmarty | A Tool for Learning Something New Everyday')
  end
end
