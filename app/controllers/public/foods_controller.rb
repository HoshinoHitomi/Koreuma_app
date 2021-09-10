class Public::FoodsController < ApplicationController
  def index
    @genres = Genre.all
    @tastes = Food.tastes
    @foods = Food.page(params[:page]).per(9)

    @genre_search = params[:genre_search]
    @taste_search = params[:taste_search]
  end

  def show
    @food = Food.find(params[:id])

    @your_review = Review.find_by(user_id: current_user, food_id: params[:id])

    @review = Review.new

    @reviews = @food.reviews

  end
end
