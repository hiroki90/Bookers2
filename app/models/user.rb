class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  attachment :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }
  validates :name, uniqueness: true
  validates :introduction, length: { maximum: 50 }
end
