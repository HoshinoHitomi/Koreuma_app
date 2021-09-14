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
    @reviews = @food.reviews

    @data = [
      ['甘味', @food.sweet_like_average],
      ['塩味', @food.salty_like_average],
      ['苦味', @food.bitter_like_average],
      ['酸味', @food.sour_like_average],
      ['辛味', @food.spicy_like_average],
    ]

    @review_data = [
      ['香りの強さ', @food.smell_strong_average],
      ['味の強さ', @food.taste_strong_average],
    ]
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
