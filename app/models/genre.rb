class Genre < ApplicationRecord
  has_many :foods

  validates :name, presence: true, uniqueness: true, length: { in: 1..30 }
end
