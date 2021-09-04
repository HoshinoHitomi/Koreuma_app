class Public::ReviewsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    @reviews = user.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to food_path(params[:food_id])
  end

  def edit
    review = Review.where(user_id: current_user.id, food_id: params[:food_id]).ids
    @review = Review.find(review)
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
