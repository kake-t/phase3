class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to:'danbain.tobimasu@gmail.com', subject: '投稿完了'
  end
end
