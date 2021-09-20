class Food < ApplicationRecord
  belongs_to :shop
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :favorite_foods, dependent: :destroy

  attachment :image

  enum taste: { nothing: 0, sweet: 1, salty: 2, bitter: 3, sour: 4, spicy: 5 }
  enum food_temperature: { tepid: 0, hot: 1, cold: 2 }
  enum status: { before: 0, on_sale: 1, stop: 2, finish: 3 }

  def food_favorited_by?(user)
    favorite_foods.where(user_id: user.id).exists?
  end

  def self.food_ranking
    Food.find(FavoriteFood.group(:food_id).order('count(food_id) desc').limit(3).pluck(:food_id))
  end

  def self.search(search)
    Food.where(['name LIKE ?', "%#{search}%"])
    Food.where(['introduction LIKE ?', "%#{search}%"])
  end

  def tax_price
    (self.price * 1.08).round
  end

  def taste_score_average
    taste_score = reviews.pluck(:taste_score)
    if taste_score == []
      "- -"
    else
      taste_score.sum.fdiv(taste_score.length).round(2)
    end
  end

  def taste_strong_average
    taste_strong = reviews.pluck(:taste_strong)
    if taste_strong == []
      5.0
    else
      taste_strong.sum.fdiv(taste_strong.length).round(1)
    end
  end

  def smell_strong_average
    smell_strong = reviews.pluck(:smell_strong)
    if smell_strong == []
      5.0
    else
      smell_strong.sum.fdiv(smell_strong.length).round(1)
    end
  end

  def sweet_like_average
    true_flags = reviews.where(repeat: true)
    sweet_like = true_flags.pluck(:sweet_like)
    if sweet_like == []
      2.5
    else
      sweet_like.sum.fdiv(sweet_like.length).round(1)
    end
  end

  def salty_like_average
    true_flags = reviews.where(repeat: true)
    salty_like = true_flags.pluck(:salty_like)
    if salty_like == []
      2.5
    else
      salty_like.sum.fdiv(salty_like.length).round(1)
    end
  end

  def bitter_like_average
    true_flags = reviews.where(repeat: true)
    bitter_like = true_flags.pluck(:bitter_like)
    if bitter_like == []
      2.5
    else
      bitter_like.sum.fdiv(bitter_like.length).round(1)
    end
  end

  def sour_like_average
    true_flags = reviews.where(repeat: true)
    sour_like = true_flags.pluck(:sour_like)
    if sour_like == []
      2.5
    else
      sour_like.sum.fdiv(sour_like.length).round(1)
    end
  end

  def spicy_like_average
    true_flags = reviews.where(repeat: true)
    spicy_like = true_flags.pluck(:spicy_like)
    if spicy_like == []
      2.5
    else
      spicy_like.sum.fdiv(spicy_like.length).round(1)
    end
  end

  with_options presence: true do
    validates :image
    validates :price
  end

  validates :name, length: { in: 1..50 }
  validates :introduction, length: { in: 1..300 }
  validates :price, numericality: true
end
