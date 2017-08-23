class FacebookPostJob < ApplicationJob
  queue_as :default

  def perform(user:, wall_post:, post_url:)
    token = user.social_connections.find_by_provider('facebook').token
    graph = Koala::Facebook::API.new(token)
    graph.put_wall_post("#{wall_post} #{post_url}")
  end
end
