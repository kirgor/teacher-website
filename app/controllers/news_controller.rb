class NewsController < ApplicationController
  def index
    @news = News.find(params[:id])
  end

  def all
    @news = News.all
  end
end