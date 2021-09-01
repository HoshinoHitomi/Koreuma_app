class Public::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    binding.pry
    @food = Food.find(params[:id])
    @shop = Shop.find_by(id: :shop_id)

    sweet_like = Food.pluck(:sweet_like)
    @sweet_like_average = sweet_like.sum.fdiv(sweet_like.length)

    salty_like = Food.pluck(:salty_like)
    @salty_like_average = salty_like.sum.fdiv(salty_like.length)

    bitter_like = Food.pluck(:bitter_like)
    @bitter_like_average = bitter_like.sum.fdiv(bitter_like.length)

    sour_like = Food.pluck(:sour_like)
    @sour_like_average = sour_like.sum.fdiv(sour_like.length)

    spicy_like = Food.pluck(:spicy_like)
    @spicy_like_average = spicy_like.sum.fdiv(spicy_like.length)
  end
end
