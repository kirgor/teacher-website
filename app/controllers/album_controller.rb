class AlbumController < ApplicationController
  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def all
    @albums = Album.all
  end

  def add
    @album = Album.create(:title => '')
    render 'edit'
  end

  def delete
    Album.delete(params[:id])
    redirect_to :action => 'all'
  end

  def save
    a = Album.find(params[:id])
    a.title = params[:title]
    a.save
    redirect_to :action => 'show', :id => a.id
  end
end