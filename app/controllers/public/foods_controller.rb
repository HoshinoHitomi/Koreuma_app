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

  end
end
