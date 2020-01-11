class SearchController < ApplicationController
  def query
    if !params[:q].blank?
      @posts = Post
                 .published
                 .search_by_term(params[:q])
                 .page(params[:page])
                 .per(10)
    elsif params[:q].blank? && request
      redirect_to request.referer, notice: 'You need to enter a search query'
    else
      redirect_to root_path, notice: 'You need to enter a search query'
    end
  end
end
