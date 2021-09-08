class Shop::FoodsController < Shop::ApplicationController
  def index
    @shop = current_shop
    @foods = @shop.foods.page(params[:page])
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
    @food = Food.find_by(id: params[:id])
    if @food.nil?
      flash[:alert] = "食べ物が見つかりませんでした。"
      redirect_to shop_foods_path
    end
  end

  def edit
    @food = Food.find_by(id: params[:id])
    if @food.nil?
      flash[:alert] = "食べ物が見つかりませんでした。"
      redirect_to shop_foods_path
    end
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
