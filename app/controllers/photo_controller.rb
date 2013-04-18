class PhotoController < ApplicationController
  def index
    @photo = Photo.find(params[:id])
  end

  def add
    photo = Album.find(params[:album_id]).photos.create
    f = File.new(Rails.root.join('public', 'photos', photo.id.to_s + '.jpg'), 'wb')
    f.write(params[:file].read)
    f.close
    redirect_to :controller => 'album', :action => 'edit', :id => params[:album_id]
  end

  def delete
    a = Photo.find(params[:id]).album
    Photo.delete(params[:id])
    redirect_to :controller => 'album', :action => 'edit', :id => a.id
  end
end