class TwitterPostJob < ApplicationJob
  include ActionView::Helpers::TextHelper
  queue_as :default

  def perform(user:, wall_post:, post_url:)
    social_connection = user.social_connections.find_by_provider('twitter')

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch('TWITTER_CONSUMER_KEY')
      config.consumer_secret     = ENV.fetch('TWITTER_CONSUMER_SECRET')
      config.access_token        = social_connection.token
      config.access_token_secret = social_connection.twitter_token_secret
    end

    client.update("#{wall_post.title} #{post_url}")
  end
end

