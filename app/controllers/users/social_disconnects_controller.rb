class Users::SocialDisconnectsController < ApplicationController
  before_action :authenticate_user!

  def disconnect_facebook
    puts "-----------------", "disconnecting facebook..."
    current_user.social_connections.find_by_provider('facebook').destroy
    redirect_to root_path, alert: 'Your have disconnected Facebook from your account'
  end
end
