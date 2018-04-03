class PicturesController < ApplicationController
  def top; end

  def index
  @pictures = Picture.all.order('created_at desc')
  end

  def new
  end

  def show
  end

  def edit
  end

  private
  def pictures_params
    params.require(:picture).permit(:image, :title, :content, :user_name)
  end
end
