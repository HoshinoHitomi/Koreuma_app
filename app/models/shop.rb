class Shop < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :favorite_shops, dependent: :destroy

  attachment :shop_image

  def active_for_authentication?
    super && (self.is_active == true)
  end
end
