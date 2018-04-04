class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  def top; end

  def index
    @pictures = Picture.all.order('created_at desc')
  end

  def new
    @picture = if params[:back]
                 Picture.new(picture_params)
               else
                 Picture.new
               end
  end

  def show
  end

  def edit
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.image.retrieve_from_cache! params[:cache][:image]
    if @picture.save
      redirect_to pictures_path, notice: '作成しました'
    else
      render 'new'
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: '削除しました'
  end

  def confirm
    @picture = Picture.new(picture_params)
    render 'new' if @picture.invalid?
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
    @picture = Picture.find(params[:id])
  end
end
