class Public::FavoriteFoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    favorite_food = FavoriteFood.where(user_id: @user).pluck(:food_id)
    @favorite_foods = Food.find(favorite_food)
  end

  def create
    food = Food.find(params[:food_id])
    favorite_food = current_user.favorite_foods.new(food_id: food.id)
    favorite_food.save
    redirect_to food_path(food)
  end

  def destroy
    food = Food.find(params[:food_id])
    favorite_food = current_user.favorite_foods.find_by(food_id: food.id)
    favorite_food.destroy
    redirect_to food_path(food)
  end
end
