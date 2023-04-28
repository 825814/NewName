class SearchesController < ApplicationController
  def search
    @articles = Article.search(params[:qkeyword])
  end
end
