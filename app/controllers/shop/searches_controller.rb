class Shop::SearchesController < ApplicationController
  def index
    @search = params[:search]

    @foods = current_shop.foods.search(@search)
  end
end
