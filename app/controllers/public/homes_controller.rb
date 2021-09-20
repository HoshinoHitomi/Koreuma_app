class Public::HomesController < ApplicationController
  def top
    @food_ranks = Food.food_ranking
    @shop_ranks = Shop.shop_ranking
    @foods = Food.last(4).reverse
    @shops = Shop.last(4).reverse
  end

  def about
    @shops = Shop.all
    @foods = Food.all
  end

  def which_sign_up
  end

  def which_sign_in
  end

  def all_reviews
    @reviews = Review.page(params[:page]).per(10).order(updated_at: :DESC)
  end
end
