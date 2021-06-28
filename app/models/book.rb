class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 200 }
end
