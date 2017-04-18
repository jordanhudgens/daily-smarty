require 'rails_helper'

RSpec.describe User, type: :model do
  it 'can create a user factory' do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end
end
