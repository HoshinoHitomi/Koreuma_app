class Public::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])

    taste_strong = Review.pluck(:taste_strong)
    @taste_strong_average = taste_strong.sum.fdiv(taste_strong.length)

    @reviews = Review.all

    @review = Review.new
  end
end
