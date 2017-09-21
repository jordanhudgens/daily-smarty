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

  it 'it allows the user to login and redirects them to the homepage' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'asdfasdf'

    click_on 'Login'

    expect(page).to have_content('My Feed')
  end
end
