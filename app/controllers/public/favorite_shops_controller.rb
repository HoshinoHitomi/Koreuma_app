class Public::FavoriteShopsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした。"
      redirect_to root_path
    else
      favorite_shop = FavoriteShop.where(user_id: @user).pluck(:shop_id)
      @favorite_shops = Shop.find(favorite_shop)
    end
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
