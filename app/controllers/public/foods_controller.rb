class Public::FoodsController < ApplicationController
  def index
    @genres = Genre.all
    @tastes = Food.tastes
    @genre_search = params[:genre_search]
    @taste_search = params[:taste_search]

    case params[:shop]

    when 'shop'

      shop_id = Rails.application.routes.recognize_path(request.referer)[:id]
      @shop = Shop.find(shop_id)
      @foods = @shop.foods.page(params[:page])

    else

      @foods = Food.page(params[:page]).per(9)

    end
  end

  def show
    @food = Food.find(params[:id])

    @your_review = Review.find_by(user_id: current_user, food_id: params[:id])

    @review = Review.new

    @reviews = @food.reviews

    @data = [
      ['甘味', @food.sweet_like_average],
      ['塩味', @food.salty_like_average],
      ['苦味', @food.bitter_like_average],
      ['酸味', @food.sour_like_average],
      ['辛味', @food.spicy_like_average],
    ]

    @review_data = [
      ['香りの強さ', @food.smell_strong_average],
      ['味の強さ', @food.taste_strong_average],
    ]

  end
end
