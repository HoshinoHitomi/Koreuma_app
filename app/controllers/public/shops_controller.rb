class Public::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @foods = @shop.foods.page(params[:page])
  end
end
