class Shop::SearchesController < Shop::ApplicationController
  def index
    @search = params[:search]

    @foods = current_shop.foods.search(@search)
  end
end
