class PicturesController < ApplicationController
  before_action :set_picture, only: %i[show edit update destroy]
  before_action :return_to_login, only: %i[new edit show]

  def top; end

  def index
    @pictures = Picture.all.order('created_at desc')
  end

  def new
    @picture = if params[:back]
                 current_user.pictures.new(picture_params)
               else
                 current_user.pictures.new
               end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def create
    @picture = current_user.pictures.new(picture_params)
    @picture.user_id = current_user.id
    @picture.user_name = current_user.name
    @picture.image.retrieve_from_cache! params[:cache][:image]
    if @picture.save
      PictureMailer.picture_mail(@picture).deliver
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
    @picture = current_user.pictures.new(picture_params)
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

  def return_to_login
    redirect_to new_session_path unless logged_in?
  end
end
