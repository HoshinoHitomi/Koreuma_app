class Shop::HomesController < Shop::ApplicationController
  def top
    @shop = current_shop
    @foods = @shop.foods.last(4).reverse
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = Shop.find_by(id: current_shop.id)
    if @shop.email == 'guest@shop'
      flash[:alert] = "ゲストのお店は編集できません。"
      redirect_to shop_root_path
    elsif @shop.update(shop_params)
      flash[:notice] = "お店情報を編集しました。"
      redirect_to shop_root_path
    else
      render :edit
    end
  end

  def confirm
  end

  def withdrawl
    @shop = Shop.find_by(id: current_shop.id)
    if @shop.email == 'guest@shop'
      flash[:alert] = "ゲストのお店は退会できません。"
      redirect_to shop_root_path
    else
      @shop.update(is_active: false)
      reset_session
      flash[:notice] = "退会しました。"
      redirect_to root_path
    end
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
      :working_time
    )
  end
end
