class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    oauth = request.env['omniauth.auth']
    puts '---', oauth.provider, oauth.uid, oauth.credentials.token
    # TODO
  end

  def failure
    redirect_to root_path
  end
end
