class Public::FoodsController < ApplicationController
  def index
    @genres = Genre.all
    @tastes = Food.tastes
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])

    @your_review = Review.find_by(user_id: current_user, food_id: params[:id])

    @review = Review.new

    @reviews = @food.reviews

  end
end
