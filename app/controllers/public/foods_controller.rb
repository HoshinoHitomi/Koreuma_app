class Public::FoodsController < ApplicationController
  def index
    @genres = Genre.all
    @tastes = Food.tastes
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])

    @taste_strong_average = @food.taste_strong_average

    @smell_strong_average =  @food.smell_strong_average

    @sweet_like_average = @food.sweet_like_average

    @salty_like_average = @food.salty_like_average

    @bitter_like_average = @food.bitter_like_average

    @sour_like_average = @food.sour_like_average

    @spicy_like_average = @food.spicy_like_average

    @your_review = Review.find_by(user_id: current_user, food_id: params[:id])

    @review = Review.new

    @reviews = @food.reviews
  end
end
