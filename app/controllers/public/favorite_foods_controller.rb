class Public::FavoriteFoodsController < ApplicationController
  def index
    favorite_foods = FavoriteFood.where(user_id: params[:user_id]).pluck(:food_id)
    @favorite_foods = Food.find(favorite_foods)
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