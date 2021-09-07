class Genre < ApplicationRecord
  has_many :foods

  validates :name, presence: true, uniqueness: true
end
