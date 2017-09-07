require 'rails_helper'

describe 'Static Pages' do
  it 'has a homepage with a specific title' do
    visit root_path
    expect(page.title).to eq('DailySmarty | A Tool for Learning Something New Everyday')
  end

  it 'shows a feed page when a user is logged in' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit root_path
    expect(page).to have_content('My Feed')
  end
end
