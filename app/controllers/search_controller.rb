class SearchController < ApplicationController
  def query
    if params[:q].blank?
      redirect_to request.referer, notice: 'You need to enter a search query'
    else
      @posts = Post.search(params[:q]).records.page(params[:page]).per(10)
    end
  end
end
