class Public::FoodsController < ApplicationController
  def index
    @genres = Genre.all
    @tastes = Food.tastes
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])

    taste_strong = @food.reviews.pluck(:taste_strong)
    @taste_strong_average = taste_strong.sum.fdiv(taste_strong.length)
    smell_strong = @food.reviews.pluck(:smell_strong)
    @smell_strong_average = smell_strong.sum.fdiv(smell_strong.length)

    sweet_like = @food.reviews.where(repeat: true).pluck(:sweet_like)
    @sweet_like_average = sweet_like.sum.fdiv(sweet_like.length)

    salty_like = @food.reviews.where(repeat: true).pluck(:salty_like)
    @salty_like_average = salty_like.sum.fdiv(salty_like.length)

    bitter_like = @food.reviews.where(repeat: true).pluck(:bitter_like)
    @bitter_like_average = bitter_like.sum.fdiv(bitter_like.length)

    sour_like = @food.reviews.where(repeat: true).pluck(:sour_like)
    @sour_like_average = sour_like.sum.fdiv(sour_like.length)

    spicy_like = @food.reviews.where(repeat: true).pluck(:spicy_like)
    @spicy_like_average = spicy_like.sum.fdiv(spicy_like.length)


    your_review = Review.where(user_id: current_user, food_id: params[:id]).ids
    @your_review = Review.find(your_review)

    @review = Review.new

    @reviews = @food.reviews
  end
end
