class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!

  def disconnect_facebook
    puts "-----------------", "disconnecting facebook..."
    redirect_to root_path
  end

  def facebook
    oauth = request.env['omniauth.auth']

    if SocialConnection.find_by_uid(oauth.uid)
      SocialConnection.find_by_uid(oauth.uid).update!(user: current_user, uid: oauth.uid, provider: oauth.provider, token: oauth.credentials.token)
    else
      SocialConnection.create!(user: current_user, uid: oauth.uid, provider: oauth.provider, token: oauth.credentials.token)
    end

    redirect_to root_path, notice: 'Facebook has been connected, you can now share posts to your wall'
  end

  def failure
    redirect_to root_path
  end
end
