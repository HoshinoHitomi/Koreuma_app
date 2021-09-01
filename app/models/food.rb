class Food < ApplicationRecord
  belongs_to :shop
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :favorite_foods, dependent: :destroy

  def food_favorited_by?(user)
    favorite_foods.where(user_id: user.id).exists?
  end

  attachment :image

  enum taste: { no: 0, sweet: 1, salty: 2, bitter: 3, sour: 4, spicy: 5 }
  enum food_temperature: { tepid: 0, hot: 1, cold: 2 }
  enum status: { before: 0, on_sale: 1, stop: 2, finish: 3 }
end
