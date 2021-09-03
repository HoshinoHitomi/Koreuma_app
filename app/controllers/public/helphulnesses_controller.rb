class Public::HelphulnessesController < ApplicationController
  def create
    review = Review.where(food_id: params[:food_id])
    helphul = current_user.helphulnesses.new(review_id: review.ids)
    helphul.save
    redirect_to food_path(params[:food_id])
  end

  def destroy
    food = Food.find(params[:food_id])
    favorite_food = current_user.favorite_foods.find_by(food_id: food.id)
    favorite_food.destroy
    redirect_to food_path(food)
  end
end
