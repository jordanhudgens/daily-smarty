require 'rails_helper'

describe 'navigation' do
  it 'has login and registration links if the user is not logged in' do
    visit root_path
    expect(page).to have_link('Login')
    expect(page).to have_link('Register')
  end

  it 'does not has login and registration links if the user is logged in' do
    user = FactoryGirl.create(:user)
    login_as(user)
    visit root_path
    expect(page).to_not have_link('Login')
    expect(page).to_not have_link('Register')
  end
end
