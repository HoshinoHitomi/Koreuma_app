class Review < ApplicationRecord
  belongs_to :user
  belongs_to :food
  has_many :helphulnesses, dependent: :destroy

  validates :taste_score, numericality: {
  less_than_or_equal_to: 5,
  greater_than_or_equal_to: 0.5
  }, presence: true

  validates :body, length: { in: 0..300 }
end
