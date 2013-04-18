class NewsController < ApplicationController
  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def all
    @news = News.where('general' => true)
  end

  def my_class
    @news = News.where('general' => false)
    render 'all'
  end

  def add
    @news = News.create(:title => '', :content => '', :datetime => Time.now, :general => params[:general])
    render 'edit'
  end

  def delete
    n = News.find(params[:id])
    News.delete(params[:id])
    redirect_to :action => n.general ? 'all' : 'my_class'
  end

  def save
    n = News.find(params[:id])
    n.title = params[:title]
    n.content = params[:content]
    n.save
    redirect_to :action => 'show', :id => n.id
  end
end