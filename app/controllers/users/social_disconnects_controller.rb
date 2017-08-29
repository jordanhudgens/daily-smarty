class Users::SocialDisconnectsController < ApplicationController
  before_action :authenticate_user!

  def disconnect_facebook
    current_user.social_connections.find_by_provider('facebook').destroy
    redirect_to root_path, alert: 'Your have disconnected Facebook from your account'
  end

  def disconnect_twitter
    current_user.social_connections.find_by_provider('twitter').destroy
    redirect_to root_path, alert: 'Your have disconnected Twitter from your account'
  end
end
