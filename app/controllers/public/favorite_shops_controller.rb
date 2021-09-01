class Public::FavoriteShopsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    favorite_shop = FavoriteShop.where(user_id: @user).pluck(:shop_id)
    @favorite_shops = Shop.find(favorite_shop)
  end

  def create
    shop = Shop.find(params[:shop_id])
    favorite_shop = current_user.favorite_shops.new(shop_id: shop.id)
    favorite_shop.save
    redirect_to shop_path(shop)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    favorite_shop = current_user.favorite_shops.find_by(shop_id: shop.id)
    favorite_shop.destroy
    redirect_to shop_path(shop)
  end
end
