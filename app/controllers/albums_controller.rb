class AlbumsController < ApplicationController
  def index
    @album = Album.find(params[:id])
  end

  def all
    @albums = Album.all
  end

  def add
    Album.create(:title => params[:title])
  end

  def delete
    Album.delete(:id => params[:id])
  end
end