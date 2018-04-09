class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorite, source: :user

  mount_uploader :image, ImageUploader
  validates :title, presence: true,
                    length: { maximum: 140 }
  validates :image, presence: true
  validates :content, presence: true,
                      length: { maximum: 140 }
end
