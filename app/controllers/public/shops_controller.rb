class Public::ShopsController < ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(9)
  end

  def show
    @shop = Shop.find_by(id: params[:id])
    if @shop.nil?
      flash[:alert] = "お店が見つかりませんでした。"
      redirect_to root_path
    else
      @foods = @shop.foods.last(4).reverse
    end
  end
end
