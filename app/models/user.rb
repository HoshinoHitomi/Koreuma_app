class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :foods, through: :favorite_foods, source: :food
  has_many :favorite_foods, dependent: :destroy
  has_many :favorite_shops, dependent: :destroy

  enum sweet_like: { hate: 1, dislike: 2, like: 3, really_like: 4 }, _prefix: :sweet
  enum salty_like: { hate: 1, dislike: 2, like: 3, really_like: 4 }, _prefix: :salty
  enum bitter_like: { hate: 1, dislike: 2, like: 3, really_like: 4 }, _prefix: :bitter
  enum sour_like: { hate: 1, dislike: 2, like: 3, really_like: 4 }, _prefix: :sour
  enum spicy_like: { hate: 1, dislike: 2, like: 3, really_like: 4 }, _prefix: :spicy

  def active_for_authentication?
    super && (self.is_active == true)
  end

end
