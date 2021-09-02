class Public::ReviewsController < ApplicationController
  def index
  end

  def create
    food = Food.where(id: params[:food_id])
    @review = Review.new(review_params)

    if @review.repeat == true
      user_sweet_like = User.find(current_user.id).sweet_like_before_type_cast.to_f
      user_salty_like = User.find(current_user.id).salty_like_before_type_cast.to_f
      user_bitter_like = User.find(current_user.id).bitter_like_before_type_cast.to_f
      user_sour_like = User.find(current_user.id).sour_like_before_type_cast.to_f
      user_spicy_like = User.find(current_user.id).spicy_like_before_type_cast.to_f

      @sweet_like = (food.pluck(:sweet_like) << user_sweet_like).sum.fdiv(2)
      @salty_like = (food.pluck(:salty_like) << user_salty_like).sum.fdiv(2)
      @bitter_like = (food.pluck(:bitter_like) << user_bitter_like).sum.fdiv(2)
      @sour_like = (food.pluck(:sour_like) << user_sour_like).sum.fdiv(2)
      @spicy_like = (food.pluck(:spicy_like) << user_spicy_like).sum.fdiv(2)

      food.update_all( sweet_like: @sweet_like,
                       salty_like: @salty_like,
                       bitter_like: @bitter_like,
                       sour_like: @sour_like,
                       spicy_like: @spicy_like,
      )
    end

    @review.save
    redirect_to food_path(params[:food_id])
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :food_id, :body, :smell_strong, :taste_strong, :taste_score, :repeat)
  end

end
