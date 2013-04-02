class PhotosController < ApplicationController
  def index
    @photo = Photo.find(params[:id])
  end

  def add
    photo = Album.find(params[:album_id]).photos.create
    File.open(Rails.root.join('public', 'photos', photo.id + '.jpg'), 'w') { |f| f.write(params[:file].read) }
  end

  def delete
    Photo.delete(:id => params[:id])
  end
end