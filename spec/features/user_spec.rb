require 'rails_helper'

describe 'User feature' do
  it 'should allow users to register' do
    visit new_user_registration_path

    fill_in 'user[full_name]', with: 'Jon Snow'
    fill_in 'user[username]', with: 'kingofthenorth'
    fill_in 'user[email]', with: 'jon@snow.com'
    fill_in 'user[password]', with: 'asdfasdf'
    fill_in 'user[password_confirmation]', with: 'asdfasdf'

    expect { click_on "Sign up" }.to change(User, :count).by(1)
  end
end
