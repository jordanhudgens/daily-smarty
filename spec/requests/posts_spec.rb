require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "can request the posts API via a GET request and does not require auth" do
      get posts_url(subdomain: 'api')
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end

    xit "retrieves a list of posts" do
      post_one = FactoryGirl.create(:post)
      post_two = FactoryGirl.create(:post)
      get posts_url(subdomain: 'api')
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /posts" do
    xit 'can create a post with the proper auth' do

    end
  end
end
