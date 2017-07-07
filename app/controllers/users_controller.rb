class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(21)
  end
end
