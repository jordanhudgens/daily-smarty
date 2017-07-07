class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(21)
  end

  def follow
    Following.create!(follower_id: current_user.id, user_id: params[:following_id])
    head :ok
  end
end
