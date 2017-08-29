class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :authenticate_user!

  def facebook
    oauth = request.env['omniauth.auth']

    if SocialConnection.find_by_uid(oauth.uid)
      SocialConnection.find_by_uid(oauth.uid).update!(user: current_user, uid: oauth.uid, provider: oauth.provider, token: oauth.credentials.token)
    else
      SocialConnection.create!(user: current_user, uid: oauth.uid, provider: oauth.provider, token: oauth.credentials.token)
    end

    redirect_to root_path, notice: 'Facebook has been connected, you can now share posts to your wall'
  end

  def twitter
    oauth = request.env['omniauth.auth']

    if SocialConnection.find_by_uid(oauth.uid)
      SocialConnection.find_by_uid(oauth.uid).update!(user: current_user, uid: oauth.uid, provider: oauth.provider, token: oauth.credentials.token)
    else
      SocialConnection.create!(user: current_user, uid: oauth.uid, provider: oauth.provider, token: oauth.credentials.token, twitter_token_secret: oauth.credentials.secret)
    end

    redirect_to root_path, notice: 'Twitter has been connected, you can now share posts to your wall'
  end

  def failure
    redirect_to root_path
  end
end
