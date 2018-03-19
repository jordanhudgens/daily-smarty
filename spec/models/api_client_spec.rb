require 'rails_helper'

RSpec.describe ApiClient, type: :model do
  before do 
    @user = FactoryBot.create(:user)
  end

  it 'can be created' do
    api_client = FactoryBot.create(:api_client, user: @user)
    expect(api_client).to be_valid
  end

  it 'requires a user to be valid' do
    api_client = ApiClient.create
    expect(api_client).to_not be_valid
  end

  it 'auto generates the api_key' do
    api_client = FactoryBot.create(:api_client, user: @user)
    expect(api_client.api_key).to_not be_nil
  end
end
