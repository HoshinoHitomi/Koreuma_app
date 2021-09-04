class Public::HomesController < ApplicationController
  def top
    @food_ranks = Food.find(FavoriteFood.group(:food_id).order('count(food_id) desc').limit(5).pluck(:food_id))
    @shop_ranks = Shop.find(FavoriteShop.group(:shop_id).order('count(shop_id) desc').limit(5).pluck(:shop_id))
    @foods = Food.last(4)
    @shops = Shop.last(4)
  end

  def about
  end

  def which_sign_up
  end

  def which_sign_in
  end

  def all_reviews
    @reviews = Review.all
  end
end
