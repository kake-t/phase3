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
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:image,
                                    :image_cache,
                                    :title,
                                    :content,
                                    :user_name)
  end

  def set_picture
  end
end
