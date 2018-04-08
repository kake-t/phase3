class Picture < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader
  validates :title, presence: true,
                    length: { maximum: 140 }
  validates :image, presence: true
  validates :content, presence: true,
                      length: { maximum: 140 }
end
