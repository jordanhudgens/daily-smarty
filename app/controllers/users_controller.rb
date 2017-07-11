class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(21)
  end

  def follow_toggle
    if Following.where(follower_id: current_user.id, user_id: params[:following_id]).any?
      Following.find_by_follower_id_and_user_id(current_user.id, params[:following_id]).destroy
      head :ok
    else
      Following.create!(follower_id: current_user.id, user_id: params[:following_id])
      head :ok
    end
  end
end
