class Shop::HomesController < ApplicationController
  def top
    @shop = current_shop
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = Shop.find_by(id: current_shop.id)
    @shop.update(shop_params)
    redirect_to shop_root_path
  end

  def confirm
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :introduction, :shop_image, :address, :phone_number, :working_time )
  end
end
