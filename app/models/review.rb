class Review < ApplicationRecord
  belongs_to :user

    validates :taste_score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5
  }, presence: true

end
