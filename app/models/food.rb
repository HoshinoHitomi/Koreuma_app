class Food < ApplicationRecord
  belongs_to :shop
  belongs_to :genre

  attachment :image

  enum taste: { no: 0, sweet: 1, salty: 2, bitter: 3, sour: 4, spicy: 5 }
  enum food_temperature: { tepid: 0, hot: 1, cold: 2 }
  enum status: { before: 0, on_sale: 1, stop: 2, finish: 3 }
end
