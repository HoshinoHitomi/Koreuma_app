class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    food_favorites = FavoriteFood.where(user_id: params[:id]).pluck(:food_id)
    @favorite_foods = Food.find(food_favorites).last(4)

    shop_favorites = FavoriteShop.where(user_id: params[:id]).pluck(:shop_id)
    @favorite_shops = Shop.find(shop_favorites).last(4)

    @reviews = @user.reviews
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def confirm
  end

  def withdrawl
    @user = User.find_by(id: current_user.id)
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(
      :name,
      :profile_image,
      :introduction,
      :sweet_like,
      :salty_like,
      :bitter_like,
      :sour_like,
      :spicy_like
    )
  end
end
