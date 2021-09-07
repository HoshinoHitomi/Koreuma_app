class Shop < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :favorite_shops, dependent: :destroy

  attachment :shop_image

  def shop_favorited_by?(user)
    favorite_shops.where(user_id: user.id).exists?
  end

  def active_for_authentication?
    super && (self.is_active == true)
  end

  def self.guest
    find_or_create_by!(email: 'guest@shop') do |shop|
        shop.password = SecureRandom.urlsafe_base64
        shop.name = 'ゲストさんのお店'
        shop.address = '東京'
        shop.phone_number = '1234567'
        shop.working_time = '年中無休'
    end
  end

  def self.search(search)
    Shop.where(['name LIKE ?', "%#{search}%"])
  end

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :working_time, presence: true
  validates :phone_number, presence: true
end
