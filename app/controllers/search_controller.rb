class SearchController < ApplicationController
  def query
    if params[:q].blank?
      redirect_to request.referer, notice: 'You need to enter a search query'
    else
      @posts = Post
                 .published
                 .search_by_term(params[:q])
                 .page(params[:page])
                 .per(10)
    end
  end
end
