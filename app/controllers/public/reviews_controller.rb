class Public::ReviewsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした。"
      redirect_to root_path
    else
      @reviews = @user.reviews.page(params[:pade]).per(10).order(updated_at: :DESC)
    end
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to food_path(params[:food_id])
    else
      flash[:alert] = "おいしさ評価を入力してください"
      redirect_to food_path(params[:food_id])
    end
  end

  def edit
    food = Food.find_by(id: params[:food_id])
    if food.nil?
      flash[:alert] = "レビューが見つかりませんでした。"
      redirect_to root_path
    else
      review = Review.where(user_id: current_user.id, food_id: food).ids
      @review = Review.find(review)
    end
  end

  def update
    @review = Review.find_by(user_id: current_user.id, food_id: params[:food_id])
    @review.update(review_params)
    redirect_to food_path(params[:food_id])
  end

  def destroy
    @review = Review.find_by(user_id: current_user.id, food_id: params[:food_id])
    @review.destroy
    redirect_to food_path(params[:food_id])
  end

  private

  def review_params
    params.require(:review).permit(
      :user_id,
      :food_id,
      :body,
      :smell_strong,
      :taste_strong,
      :taste_score,
      :repeat,
      :sweet_like,
      :salty_like,
      :bitter_like,
      :sour_like,
      :spicy_like,
    )
  end
end
