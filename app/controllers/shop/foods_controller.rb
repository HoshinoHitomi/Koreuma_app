class Shop::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.save
    redirect_to shop_foods_path
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(
      :shop_id,
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
