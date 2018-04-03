class PicturesController < ApplicationController
  before_action 
  def top; end

  def index
    @pictures = Picture.all.order('created_at desc')
  end

  def new
    @picture = Picture.new
  end

  def show
  end

  def edit
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.save
    redirect_to pictures_path
  end

  private
  def pictures_params
    params.require(:picture).permit(:image, :title, :content, :user_name)
  end

  def set_picture
  end
end
