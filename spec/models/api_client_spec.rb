require 'rails_helper'

RSpec.describe ApiClient, type: :model do
  it 'can be created' do
    api_client = FactoryGirl.build_stubbed(:api_client)
    expect(api_client).to be_valid
  end

  it 'requires a source_app to be valid' do
    api_client = ApiClient.create
    expect(api_client).to_not be_valid
  end

  it 'requires a source_app to be unique' do
    api_client_one = ApiClient.create(source_app: 'myfirstapp')
    api_client_duplicate = ApiClient.create(source_app: 'myfirstapp')
    expect(api_client_duplicate).to_not be_valid
  end

  it 'auto generates the api_key' do
    api_client = FactoryGirl.create(:api_client)
    expect(api_client.api_key).to_not be_nil
  end
end
