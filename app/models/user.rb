class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :reviews, dependent: :destroy
  has_many :helphulnesses, dependent: :destroy

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

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

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def self.search(search)
    User.where(['name LIKE ?', "%#{search}%"])
  end

  def self.guest
    find_or_create_by!(email: 'guest@user') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲストさん'
      user.sweet_like = 3
      user.salty_like = 3
      user.bitter_like = 3
      user.sour_like = 3
      user.spicy_like = 3
    end
  end

  with_options presence: true do
    validates :name
    validates :email
  end

  validates :name, length: { in: 1..20 }
  validates :introduction, length: { in: 1..300 }
end
