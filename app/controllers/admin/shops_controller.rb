class Admin::ShopsController < Admin::ApplicationController
  def index
    @shops = Shop.page(params[:page]).per(10)
  end

  def show
    @shop = Shop.find_by(id: params[:id])
    if @shop.nil?
      flash[:alert] = "お店が見つかりませんでした。"
      redirect_to admin_shops_path
    end
  end

  def edit
    @shop = Shop.find_by(id: params[:id])
    if @shop.nil?
      flash[:alert] = "お店が見つかりませんでした。"
      redirect_to admin_shops_path
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = "お店情報を編集しました。"
      redirect_to admin_shop_path(@shop)
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(
      :name,
      :email,
      :address,
      :phone_number,
      :is_active
    )
  end
end
