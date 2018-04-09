class User < ApplicationRecord
  has_many :pictures, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture

  validates :name, presence: true,
                   length: { maximum: 30 }
  validates :email, presence: true,
                    length: { maximum: 250 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  before_save { email.downcase! }
  has_secure_password
end
