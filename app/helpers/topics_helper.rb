module TopicsHelper
  def topic_follow_buttons(topic_to_follow: topic, logged_in_user: current_user)
    if logged_in_user
      if current_user.topics.any? && current_user.topic_ids.include?(topic_to_follow.id)
        link_to 'Following', topic_follow_toggle_path(topic_to_follow.id), class: 'topic-unfollow-link btn btn-unfollow btn-block', remote: true
      else
        link_to 'Follow', topic_follow_toggle_path(topic_to_follow.id), class: 'topic-follow-link btn btn-default btn-block', remote: true
      end
    else
      link_to 'Sign Up to Follow', new_user_registration_path, class: 'btn btn-default btn-block'
    end
  end
end
