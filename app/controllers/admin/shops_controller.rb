class Admin::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to admin_shop_path(@shop)
  end

  private

  def shop_params
    params.require(:shop).permit(
      :name,
      :email,
      :introduction,
      :shop_image,
      :address,
      :phone_number,
      :working_time,
      :is_active
      )
  end
end
