class Information < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
  end

  validates :title, length: { in: 1..50 }
  validates :body, length: { in: 1..500 }
end
