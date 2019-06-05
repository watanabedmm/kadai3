class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy

  attachment :image

  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 20 }
  validates :name, presence: true
  validates :introduction, length: { maximum: 50 }



end
