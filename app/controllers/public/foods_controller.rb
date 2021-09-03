class Public::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])

    taste_strong = Review.pluck(:taste_strong)
    @taste_strong_average = taste_strong.sum.fdiv(taste_strong.length)
    smell_strong = Review.pluck(:smell_strong)
    @smell_strong_average = smell_strong.sum.fdiv(smell_strong.length)

    your_review = Review.where(user_id: current_user, food_id: params[:id]).ids

    @your_review = Review.find(your_review)

    @review = Review.new

    @reviews = @food.reviews
  end
end
