class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def new_photo

  end

  def update_row
    my_photo = Photo.find(params["id"])
    my_photo.source=params["photo_image_url"]
    my_photo.caption=params["the_caption"]
    my_photo.save
    redirect_to("http://localhost:3000/photos/" + params["id"])
  end

  def edit_form
    @photo = Photo.find(params["id"])
  end

  def destroy
    my_photo = Photo.find(params["id"])
    my_photo.destroy
  end

  def create_row
    my_photo = Photo.new
    my_photo.source=params["the_source"]
    my_photo.caption=params["the_caption"]
    my_photo.save
    redirect_to("http://localhost:3000/photos")
  end


  def show
    my_photo = Photo.find(params[:id])
    @source = my_photo.source
    @caption = my_photo.caption
    @created_at = my_photo.created_at
    @updated_at = my_photo.updated_at
  end

end
