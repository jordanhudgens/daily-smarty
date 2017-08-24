class FacebookPostJob < ApplicationJob
  include ActionView::Helpers::TextHelper
  queue_as :default

  def perform(user:, wall_post:, post_url:)
    token = user.social_connections.find_by_provider('facebook').token
    graph = Koala::Facebook::API.new(token)

    if wall_post.content
      description = truncate(ActionView::Base.full_sanitizer.sanitize(wall_post.content), length: 300)
    else
      description = 'DailySmarty Post'
    end

    if wall_post.img.blank?
      image = 'https://s3.amazonaws.com/dailysmarty-production/static/og-logo.jpg'
    else
      image = wall_post.img
    end

    graph.put_wall_post("", {
      "name" => wall_post.title,
      "link" => post_url,
      "description" => description,
      "picture" => image,
    })
  end
end

