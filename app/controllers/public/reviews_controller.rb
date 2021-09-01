class Public::ReviewsController < ApplicationController
  def index
  end

  def create
    @food = Food.find(params[:food_id])
    @review = Review.new(review_params)
    @review.save
    redirect_to food_path(@food.id)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :food_id, :body, :smell_strong, :taste_strong, :taste_score, :repeat)
  end

  def taste_params
    params.require(:food).permit(:sweet_like, :salty_like, :bitter_like, :sour_like, :spicy_like)
  end
end
