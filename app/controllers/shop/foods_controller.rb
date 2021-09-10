class Shop::FoodsController < Shop::ApplicationController
  def index
    @shop = current_shop
    @foods = @shop.foods.page(params[:page]).per(6)
  end

  def new
    @food = Food.new
    @genres = Genre.all
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      flash[:notice] = "食べ物を登録しました。"
      redirect_to shop_foods_path
    else
      render :new
    end
  end

  def show
    @food = Food.find_by(id: params[:id])
    if @food.nil?
      flash[:alert] = "食べ物が見つかりませんでした。"
      redirect_to shop_foods_path
    end
    @taste_strong_average = @food.taste_strong_average

    @smell_strong_average =  @food.smell_strong_average

    @sweet_like_average = @food.sweet_like_average

    @salty_like_average = @food.salty_like_average

    @bitter_like_average = @food.bitter_like_average

    @sour_like_average = @food.sour_like_average

    @spicy_like_average = @food.spicy_like_average

    @reviews = @food.reviews
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
    if @food.update(food_params)
      flash[:notice] = "食べ物を編集しました。"
      redirect_to shop_food_path(@food)
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = "食べ物を削除しました。"
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
