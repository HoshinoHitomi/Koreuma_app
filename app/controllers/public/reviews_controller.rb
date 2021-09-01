class Public::ReviewsController < ApplicationController
  def index
  end

  def create
    food = Food.where(id: params[:food_id])
    user_sweet_like = User.find(current_user.id).sweet_like_before_type_cast
    user_salty_like = User.find(current_user.id).salty_like_before_type_cast
    user_bitter_like = User.find(current_user.id).bitter_like_before_type_cast
    user_sour_like = User.find(current_user.id).sour_like_before_type_cast
    user_spicy_like = User.find(current_user.id).spicy_like_before_type_cast

    @taste = Food.find_by(id: params[:food_id])
    @taste.sweet_like = food.pluck(:sweet_like) << user_sweet_like
    @taste.salty_like = food.pluck(:salty_like) << user_salty_like
    @taste.bitter_like = food.pluck(:bitter_like) << user_bitter_like
    @taste.sour_like = food.pluck(:sour_like) << user_sour_like
    @taste.spicy_like = food.pluck(:spicy_like) << user_spicy_like

    @taste.update(food_params)

    @review = Review.new(review_params)
    @review.save
    redirect_to food_path(@food.id)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :food_id, :body, :smell_strong, :taste_strong, :taste_score, :repeat)
  end

  def food_params
    params.permit(:sweet_like, :salty_like, :bitter_like, :sour_like, :spicy_like)
  end

end
