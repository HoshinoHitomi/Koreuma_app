class Shop::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    @genres = Genre.all
  end

  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to shop_foods_path
  end

  def show
    @food = Food.find(params[:id])

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

  def edit
    @food = Food.find(params[:id])
    @genres = Genre.all
  end

  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to shop_food_path(@food)
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to shop_foods_path
  end

  private

  def food_params
    params.require(:food).permit(
      :shop_id,
      :genre_id,
      :name,
      :image,
      :introduction,
      :taste,
      :price,
      :calorie,
      :food_temperature,
      :status,
      :sale_dates
      )
  end
end
