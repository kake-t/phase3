class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: current_user.email, subject: '投稿完了'
  end
end
